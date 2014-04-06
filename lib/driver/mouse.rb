
module ScreenDriver
  class Mouse 
    class << self
      def left_click(x, y)
        mouse = Robot.new
        mouse.mouseMove(x,y)
        mouse.mousePress(InputEvent::BUTTON2_DOWN_MASK);
        mouse.mouseRelease(InputEvent::BUTTON2_DOWN_MASK);
      end

      def double_click(x, y)
        mouse = Robot.new
        mouse.mouseMove(x, y)
        mouse.mousePress(InputEvent::BUTTON2_DOWN_MASK);
        mouse.mouseRelease(InputEvent::BUTTON2_DOWN_MASK);
        mouse.mousePress(InputEvent::BUTTON2_DOWN_MASK);
        mouse.mouseRelease(InputEvent::BUTTON2_DOWN_MASK);
      end
    end
  end
end
