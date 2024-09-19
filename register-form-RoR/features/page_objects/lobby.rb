class Lobby
  include Capybara::DSL

  def visit_register_page
    visit '/'
  end

  def fill_first_name(first_name)
    fill_in 'firstName', with: first_name
  end

  def fill_last_name(last_name)
    fill_in 'lastName', with: last_name
  end

  def fill_birthdate(birthdate)
    fill_in 'birthday', with: birthdate
  end

  def choose_gender(gender)
    if gender == 'Male'
      choose 'male'
    elsif gender == 'Female'
      choose 'female'
    end
  end

  def fill_email(email)
    fill_in 'email', with: email
  end

  def fill_phone_number(phone_number)
    fill_in 'phone', with: phone_number
  end

  def select_subject(subject)
    select subject, from: 'registration_subject'
  end

  def submit_registration
    click_button 'submit-button'
  end

  def fill_all_data(data_table)
    data_table.hashes.each do |data|
      fill_first_name(data['First Name'])
      fill_last_name(data['Last Name'])
      fill_birthdate(data['Birthday'])
      choose_gender(data['Gender'])
      fill_email(data['Email'])
      fill_phone_number(data['Phone'])
      select_subject(data['Subject'])
    end
  end

  def login_already(data_table)
    visit_register_page
    fill_all_data(data_table)
    submit_registration
  end
end