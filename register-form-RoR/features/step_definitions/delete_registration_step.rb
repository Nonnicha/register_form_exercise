Given('ฉันสมัครสมาชิกด้วยข้อมูลของฉันดังนี้แล้ว:') do |data_table|
  @lobby = Lobby.new
  @lobby.login_already(data_table)
end

When('ฉันกดลบข้อมูลของฉัน') do
  @dashboard = Dashboard.new
  @dashboard.delete_registration
end

Then('ข้อมูลของฉันจะหายไป') do
  @dashboard.saw_no_registration
end