Given('ฉันสมัครสมาชิกด้วยข้อมูลของฉันดังนี้โดยมีข้อมูลของคนอื่นอยู่แล้วด้วย:') do |data_table|
  @other_regsitration = FactoryBot.create_list(:registration, 3)
  @lobby = Lobby.new
  @lobby.login_already(data_table)
end

When('ฉันค้นหาข้อมูลของฉันจากชื่อ {string}') do |name|
  fill_in 'query', with: name
  click_button 'Search'
  sleep 5
end

Then('ฉันจะเห็นข้อมูลของฉันดังนี้แค่คนเดียว:') do |data_table|
  data_table.hashes.each do |expected_attributes|
    within '#registrations' do
      row = find('tr', text: expected_attributes['First Name'])

      expect(row).to have_content(expected_attributes['First Name'])
      expect(row).to have_content(expected_attributes['Last Name'])
      expect(row).to have_content(expected_attributes['Birthday'])
      expect(row).to have_content(expected_attributes['Gender'])
      expect(row).to have_content(expected_attributes['Email'])
      expect(row).to have_content(expected_attributes['Phone'])
      expect(row).to have_content(expected_attributes['Subject'])

      # เช็คว่ามีข้อมูลของคนที่ search แค่คนเดียวหรือไม่
      rows = all('tr')
      expect(rows.size).to eq(2) # หัวตาราง + ข้อมูลของคนที่ search
    end
  end
end