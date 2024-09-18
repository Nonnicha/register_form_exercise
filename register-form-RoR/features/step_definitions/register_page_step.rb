Given('ฉันมาที่หน้าสมัครสมาชิก') do
  @lobby = Lobby.new
  @lobby.visit_register_page
end

When('ฉันกรอกชื่อ {string}') do |first_name|
  @lobby.fill_first_name(first_name)
end

And('ฉันกรอกนามสกุล {string}') do |last_name|
  @lobby.fill_last_name(last_name)
end

And('ฉันกรอกวันเกิด {string}') do |birthdate|
  @lobby.fill_birthdate(birthdate)
end

And('ฉันกรอกเพศ {string}') do |gender|
  @lobby.choose_gender(gender)
end

And('ฉันกรอกอีเมล {string}') do |email|
  @lobby.fill_email(email)
end

And('ฉันกรอกเบอร์โทรศัพท์ {string}') do |phone_number|
  @lobby.fill_phone_number(phone_number)
end

And('ฉันกรอกเรื่องทำงาน {string}') do |subject|
  @lobby.select_subject(subject)
end

When('ฉันกดสมัครสมาชิก') do
  @lobby.submit_registration
end

Then('ฉันจะเห็นหน้า {string}') do |index_page|
  @dashboard = Dashboard.new
  @dashboard.saw_page(index_page)
end

And('เห็นข้อมูลของฉันดังนี้:') do |data_table|
  @dashboard.saw_registration(data_table)
end