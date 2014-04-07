
module ScreenDriver
  class Mouse
    def left_click(x, y)
      mouse = Robot.new
      mouse.mouseMove(x,y)
      mouse.mousePress(InputEvent::BUTTON1_MASK);
      mouse.mouseRelease(InputEvent::BUTTON1_MASK);
      #Java 7+ Only
      #mouse.mousePress(InputEvent::BUTTON1_DOWN_MASK);
      #mouse.mouseRelease(InputEvent::BUTTON1_DOWN_MASK);
    end

    def double_click(x, y)
      mouse = Robot.new
      mouse.mouseMove(x, y)
      mouse.mousePress(InputEvent::BUTTON1_MASK);
      mouse.mouseRelease(InputEvent::BUTTON1_MASK);
      mouse.mousePress(InputEvent::BUTTON1_MASK);
      mouse.mouseRelease(InputEvent::BUTTON1_MASK);
      #Java 7+ Only
      #mouse.mousePress(InputEvent::BUTTON1_DOWN_MASK);
      #mouse.mouseRelease(InputEvent::BUTTON1_DOWN_MASK);
      #mouse.mousePress(InputEvent::BUTTON1_DOWN_MASK);
      #mouse.mouseRelease(InputEvent::BUTTON1_DOWN_MASK);
    end
  end
end
