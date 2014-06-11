require "java"

java_import 'java.awt.Dimension'
java_import 'java.awt.Rectangle'
java_import 'java.awt.Robot'
java_import 'java.awt.Toolkit'
java_import 'java.awt.event.InputEvent'
java_import 'java.awt.event.KeyEvent'
java_import 'java.awt.image.BufferedImage'
java_import 'javax.imageio.ImageIO'
java_import 'java.awt.image.BufferedImage'
java_import 'java.io.ByteArrayOutputStream'

require File.join(File.dirname(__FILE__), '../target/ImageSearch.jar')
import 'ImageSearch'

require "driver/screen.rb"
require "driver/mouse.rb"
require "driver/driver.rb"
