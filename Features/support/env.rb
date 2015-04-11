require 'watir-webdriver'
require 'rubygems'
#require ' test/unit'
require 'rspec/expectations'
#include Test::Unit::Assertions;






profile = Selenium::WebDriver::Firefox::Profile.new
browser = Watir::Browser.new :firefox, :profile => profile


Before do
  if LOCALURL = nil
    require 'features/support/cucumber_settings'
  end

  @browser = browser
end


at_exit do
  @browser.close
end

module PageInitializer
  def initialize(browser)
    @browser = browser
  end
end



