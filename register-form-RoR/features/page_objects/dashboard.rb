class Dashboard
  include Capybara::DSL
  include RSpec::Matchers

  def visit_dashboard_page
    visit '/registrations'
  end

  def saw_page(index_page)
    expect(page).to have_content(index_page)
  end

  def saw_registration(data_table)
    data_table.hashes.each do |row|
      within("tr#registration_1") do
        expect(page).to have_content(row['First Name'])
        expect(page).to have_content(row['Last Name'])
        expect(page).to have_content(row['Birthday'])
        expect(page).to have_content(row['Gender'])
        expect(page).to have_content(row['Email'])
        expect(page).to have_content(row['Phone'])
        expect(page).to have_content(row['Subject'])
      end
    end
  end

  def delete_registration
    click_button 'delete_button_1'
    click_button 'confirm_button_1'
    sleep 1
  end

  def click_register_button(button)
    click_button button
  end

  def saw_no_registration
    expect(page).not_to have_selector('#registration_1')
  end

  def fill_all_data(data_table)
    @lobby = Lobby.new
    @lobby.fill_all_data(data_table)
  end
end