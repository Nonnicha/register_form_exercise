Given('ฉันมาที่หน้า Dashboard แล้ว') do
  @dashboard = Dashboard.new
  @dashboard.visit_dashboard_page
end

When('ฉันกดที่ปุ่ม {string}') do |button|
  @dashboard.click_register_button(button)
end

When('ฉันกรอกข้อมูลดังนี้:') do |data_table|
  @dashboard.fill_all_data(data_table)
end

Then('ฉันจะเห็นข้อมูลดังนี้:') do |data_table|
  @dashboard.saw_registration(data_table)
end