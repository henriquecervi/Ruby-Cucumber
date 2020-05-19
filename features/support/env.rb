require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

@browser = ENV["BROWSER"]

Capybara.configure do |config|
    case @browser
    when "chrome"
        @driver = :selenium_chrome
    when "firefox"
        @driver = :selenium
    when "chrome_headless"
        @driver = :selenium_chrome_headless
    when "firefox_headless"
        @driver = :selenium_headless
    end

    config.default_driver = @driver
    config.app_host = 'http://localhost:3000'
    config.default_max_wait_time = 15
end