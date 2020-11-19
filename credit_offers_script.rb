# Mini-script which may propose credit offers by choosing specific conditions

require 'selenium/webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://money.liga.net/'
wait = Selenium::WebDriver::Wait.new(timeout: 10)

p "Open Main Page. Current title is: #{driver.title}"
credit_amount = driver.find_element(:id, 'inputCredit')
credit_amount.send_keys '20000'

credit_type = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'selectCredit'))
credit_type.select_by(:text, 'Кредит на особисті цілі')
driver.find_element(:xpath, '//button[text()[contains(.,"Знайти пропозиції")]]').click

driver.switch_to.window(driver.window_handles.last) # Switch to new window with offers

p "Open page with credit offers. Current title is: #{driver.title}"
element = wait.until { driver.find_element(:xpath, '//mat-expansion-panel-header') }
element.click
driver.close # Close current window

driver.switch_to.window(driver.window_handles.first) # Switch to main page
p "Back to Main page. Current title is: #{driver.title}"
driver.quit # Quit the browser
