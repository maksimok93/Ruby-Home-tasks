require 'selenium/webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://money.liga.net/'

credit_amount = driver.find_element(:id, 'inputCredit')
credit_amount.send_keys '20000' #send_keys method takes the keyboard inputs

credit_type = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'selectCredit'))
credit_type.select_by(:text, 'Кредит на особисті цілі')

driver.find_element(:xpath, '//button[text()[contains(.,"Знайти пропозиції")]]').click
sleep 2

driver.switch_to.window(driver.window_handles.last)
p driver.current_url.to_s
driver.find_element(:xpath, '//mat-expansion-panel-header').click
sleep 2
