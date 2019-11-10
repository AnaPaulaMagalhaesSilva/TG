After do |scenario|
  if scenario.failed?
    encoded_img = @browser.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')
  end
	Capybara.current_session.driver.quit
end
