module ScreenDriver
  class Screen
    class << self

      def initialize
        
      end

      def screenshot
        toolkit = Toolkit::getDefaultToolkit()
        screen_size = toolkit.getScreenSize()
        rect = Rectangle.new(screen_size)
        robot = Robot.new
        image = robot.createScreenCapture(rect)
        return image
      end

      def search_image(i1, i2)
        w2=i2.getWidth
        h2=i2.getHeight
        firstpx=i2.getRGB(0,0)
        lastpx=i2.getRGB(w2-1, h2-1)
        (0..i1.getWidth-w2).each do |x|
          (0..i1.getHeight-h2).each do |y|
            if (i1.getRGB(x,y) == firstpx)
              find = i1.getSubimage(x, y, w2, h2)
              #puts x.to_s + " " + y.to_s + " " + i1.getRGB(x, y).to_s
              b1 = byte_array(find)
              b2 = byte_array(i2)

              if (java::util::Arrays.equals(b1, b2))
                #puts "Images are Equal"
                return x, y
              end
            end

          end
        end
        #puts "BOOOOO No Find"
      end

      def get_image(filename)
        file = java::io::File.new(filename)
        return ImageIO::read(file)
      end

      def byte_array(image)
        os = ByteArrayOutputStream.new
        ImageIO::write(image, "png", os)
        return os.toByteArray()
      end

      def put_image(image, filename)
        file = java::io::File.new(filename)
        ImageIO::write(image, "png", file)
      end

    end
  end
end
