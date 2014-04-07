module ScreenDriver
  class Driver
    #class << self

    def initialize
      @screen = Screen.new
      @mouse = Mouse.new
    end

    def find(image)
      ss = @screen.screenshot
      srch = @screen.get_image(image)
      x,y = @screen.search_image(ss, srch)
      if (x < 0 || y < 0)
        return false
      else
        return true
      end
    end

    def left_click(image)
      screenshot = @screen.screenshot
      srch = @screen.get_image(image)
      x,y = @screen.search_image(screenshot, srch)
      if (x >= 0 && y >= 0)
        @mouse.left_click(x, y)
      end

    end

    def doubleclick(image)
      screenshot = @screen.screenshot
      srch = @screen.get_image(image)
      x,y = @screen.search_image(screenshot, srch)
      if (x >= 0 && y >= 0)
        @mouse.double_click(x, y)
      end
    end
    #end
  end
end
