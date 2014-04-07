Screen Driver Gem
=============

To use :

require 'java'
require 'screen_driver'

@driver = ScreenDriver::Driver.new

if (@driver.find("yourimage.png"))
  puts "good"
else
  puts "bad"
end
        
