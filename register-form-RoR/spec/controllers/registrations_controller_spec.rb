require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:valid_attributes) do
    {
      firstName: 'Chanon',
      lastName: 'Wiriyathanachit',
      birthday: '1999-09-03',
      gender: 'male',
      email: Faker::Internet.email,
      phone: '0987654321',
      subject: 'Test Subject'
    }
  end

  let(:invalid_attributes) do
    { firstName: '', email: '' }
  end

  let(:registration) { create(:registration) }

  describe 'GET #new' do
    it 'assigns a new registration as @registration' do
      get :new
      expect(assigns(:registration)).to be_a_new(Registration)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Registration' do
        expect {
          post :create, params: { registration: valid_attributes }
        }.to change(Registration, :count).by(1)
      end

      it 'deletes the cache after saving' do
        expect(Rails.cache).to receive(:delete).with("registrations")
        post :create, params: { registration: valid_attributes }
      end

      it 'redirects to the registrations path' do
        post :create, params: { registration: valid_attributes }
        expect(response).to redirect_to(registrations_path)
      end
    end

    context 'with invalid params' do
      it 'renders the new template' do
        post :create, params: { registration: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #index' do
    before do
      allow(Rails.cache).to receive(:fetch).and_call_original
    end

    it 'caches the registrations' do
      get :index
      expect(Rails.cache).to have_received(:fetch).with("registrations", expires_in: 5.minutes)
    end

    it 'loads registrations from the cache' do
      registrations = create_list(:registration, 2)
      Rails.cache.write("registrations", registrations)

      get :index
      expect(assigns(:registrations)).to match_array(registrations)
    end

    it 'performs a search when query param is present' do
      registration = create(:registration, firstName: "John")
      create(:registration, firstName: "Jane")

      get :index, params: { query: 'john' }
      expect(assigns(:registrations)).to match_array([registration])
    end

    it 'sorts registrations by firstName by default' do
      john = create(:registration, firstName: "John")
      jane = create(:registration, firstName: "Jane")

      get :index
      expect(assigns(:registrations)).to eq([jane, john])
    end

    it 'sorts registrations by the given column and direction' do
      john = create(:registration, firstName: "John", lastName: "Smith")
      jane = create(:registration, firstName: "Jane", lastName: "Doe")

      get :index, params: { sort: 'lastName', direction: 'desc' }
      expect(assigns(:registrations)).to eq([john, jane])
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested registration' do
      registration = create(:registration)
      expect {
        delete :destroy, params: { id: registration.id }
      }.to change(Registration, :count).by(-1)
    end

    it 'deletes the cache' do
      create(:registration)
      expect(Rails.cache).to receive(:delete).with("registrations")

      delete :destroy, params: { id: registration.id }
    end

    it 'redirects to the registrations list' do
      registration = create(:registration)
      delete :destroy, params: { id: registration.id }
      expect(response).to redirect_to(registrations_path)
    end
  end

  describe 'GET #confirm_delete' do
    it 'renders the confirm delete modal' do
      registration = create(:registration)
      get :confirm_delete, params: { id: registration.id }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('<turbo-stream action="replace" target="modal">')
      expect(response).to render_template(partial: 'registrations/_confirm_delete')
    end
  end

  describe 'GET #register_modal' do
    it 'renders the register modal Turbo Stream' do
      get :register_modal

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('<turbo-stream action="replace" target="modal">')
      expect(response).to render_template(partial: 'registrations/_register_modal')
    end
  end
end