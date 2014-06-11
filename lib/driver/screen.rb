module ScreenDriver
  class Screen

    def initialize

    end

    def screenshot
      toolkit = Toolkit::getDefaultToolkit()
      screen_size = toolkit.getScreenSize()
      rect = Rectangle.new(screen_size)
      robot = Robot.new
      image = robot.createScreenCapture(rect)
      conv = BufferedImage.new(image.getWidth, image.getHeight, BufferedImage::TYPE_USHORT_565_RGB)
      conv.getGraphics().drawImage(image, 0, 0, nil);
      put_image(conv, "conv.png")
      return conv 
    end

    def search_image(i1, i2)
      w2=i2.getWidth
      h2=i2.getHeight
      firstpx=i2.getRGB(0,0)
      midpx=i2.getRGB(w2/2, h2/2)
      lastpx=i2.getRGB(w2-1, h2-1)
      b2 = byte_array(i2)
      (0..i1.getWidth-w2).each do |x|
        (0..i1.getHeight-h2).each do |y|
          if (i1.getRGB(x+w2/2, y+h2/2) == midpx  && i1.getRGB(x,y) == firstpx)
            find = i1.getSubimage(x, y, w2, h2)
            #puts x.to_s + " " + y.to_s + " " + i1.getRGB(x, y).to_s
            b1 = byte_array(find)

            if (java::util::Arrays.equals(b1, b2))
              #puts "Images are Equal"
              return x+w2/2, y+h2/2
            end
          end

        end
      end
      #puts "BOOOOO No Find"
      return -1, -1
    end
    
    def img_to_rgb_array(image)
      w=image.getWidth-1
      h=image.getHeight-1
      arr=[]
      (0..w).each do |x|
        tmp=[]
        (0..h).each do |y|
          tmp.push(image.getRGB(x,y))
        end
        arr.push(tmp)
      end
    end

    def get_image(filename)
      file = java::io::File.new(filename)
      buf = ImageIO::read(file) 
      conv = BufferedImage.new(buf.getWidth, buf.getHeight, BufferedImage::TYPE_USHORT_565_RGB)
      conv.getGraphics().drawImage(buf, 0, 0, nil);
      return conv
#      return ImageIO::read(file)
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
