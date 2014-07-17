module ScreenDriver
  class Driver

    def initialize
      @screen = Screen.new
      @mouse = Mouse.new
      @keys = Keys.new
    end

    def press_keys(string)
      robot = Robot.new
      keys = string.upcase.split("")
      keys.each do |key|
        kc = @keys.get(key)
        robot.keyPress(kc)
        robot.keyRelease(kc)
      end
    end

    def press_modified_key(modifier, key)
      m = @keys.get(modifier.upcase)
      k = @keys.get(key.upcase)
      robot = Robot.new
      robot.keyPress(m)
      robot.keyPress(k)
      robot.keyRelease(k)
      robot.keyRelease(m)
    end

    def screen_to_file(filename)
      ss = @screen.screenshot
      @screen.put_image(ss, filename)
    end

    def sub_screen_to_file(filename, x, y, w, h)
      ss = @screen.screenshot
      sub = ss.getSubimage(x, y, w, h)
      @screen.put_image(sub, filename)

    end

    def find(image)
      ss = @screen.screenshot
      srch = @screen.get_image(image)
      is = ImageSearch.new
      is.searchImage(ss, srch)
      puts "#{is.getX} #{is.getY}"  
      if (is.getX < 0 || is.getY < 0)
        return false
      else
        return true
      end
    end

    def move_mouse(image)
      screenshot = @screen.screenshot
      srch = @screen.get_image(image)
      is = ImageSearch.new
      is.searchImage(screenshot, srch)
      if (is.getX >= 0 && is.getY >= 0)
        @mouse.mouse_move(is.getX, is.getY)
      end

    end


    def left_click(image)
      screenshot = @screen.screenshot
      srch = @screen.get_image(image)
      is = ImageSearch.new
      is.searchImage(screenshot, srch)
      if (is.getX >= 0 && is.getY >= 0)
        @mouse.left_click(is.getX, is.getY)
      end

    end

    def doubleclick(image)
      screenshot = @screen.screenshot
      srch = @screen.get_image(image)
      is = ImageSearch.new
      is.searchImage(screenshot, srch)
      if (is.getX >= 0 && is.getY >= 0)
        @mouse.double_click(is.getX, is.getY)
      end
    end

    #Gets an array of RGB values.  Slower than the convert function.

    def get_arr(image)
      img = @screen.get_image(image)
      @screen.img_to_rgb_array(img)
    end

    # Converts an image into an array of RGB values

    def convert(image)
      ib = @screen.get_image(image)
      is = ImageSearch.new
      is.rgbArray(ib)  
    end

    # Search function will allow you to search for a images within image files.

    def search(img1, img2)
      i1 = @screen.get_image(img1)
      i2 = @screen.get_image(img2)
      is = ImageSearch.new
      #is.rgbArray(ib)  
      is.searchImage(i1, i2)
      return is.getX, is.getY
    end
  end
end
