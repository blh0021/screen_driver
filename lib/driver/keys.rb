module ScreenDriver
  class Keys

    def initialize
    end

    #Modifier Keys
    K_ALT = KeyEvent::VK_ALT
    K_SHIFT = KeyEvent::VK_SHIFT
    K_CTRL = KeyEvent::VK_CONTROL
    K_CMD = KeyEvent::VK_META

    #Function Keys
    K_F1 = KeyEvent::VK_F1
    K_F2 = KeyEvent::VK_F2
    K_F3 = KeyEvent::VK_F3
    K_F4 = KeyEvent::VK_F4
    K_F5 = KeyEvent::VK_F5
    K_F6 = KeyEvent::VK_F6
    K_F7 = KeyEvent::VK_F7
    K_F8 = KeyEvent::VK_F8
    K_F9 = KeyEvent::VK_F9
    K_F10 = KeyEvent::VK_F10
    K_F11 = KeyEvent::VK_F11
    K_F12 = KeyEvent::VK_F12


    #Alpha
    K_A = KeyEvent::VK_A
    K_B = KeyEvent::VK_B
    K_C = KeyEvent::VK_C
    K_D = KeyEvent::VK_D
    K_E = KeyEvent::VK_E
    K_F = KeyEvent::VK_F
    K_G = KeyEvent::VK_G
    K_H = KeyEvent::VK_H
    K_I = KeyEvent::VK_I
    K_J = KeyEvent::VK_J
    K_K = KeyEvent::VK_K
    K_L = KeyEvent::VK_L
    K_M = KeyEvent::VK_M
    K_N = KeyEvent::VK_N
    K_O = KeyEvent::VK_O
    K_P = KeyEvent::VK_P
    K_Q = KeyEvent::VK_Q
    K_R = KeyEvent::VK_R
    K_S = KeyEvent::VK_S
    K_T = KeyEvent::VK_T
    K_U = KeyEvent::VK_U
    K_V = KeyEvent::VK_V
    K_W = KeyEvent::VK_W
    K_X = KeyEvent::VK_X
    K_Y = KeyEvent::VK_Y
    K_Z = KeyEvent::VK_Z

    #Numeric
    K_0 = KeyEvent::VK_0
    K_1 = KeyEvent::VK_1
    K_2 = KeyEvent::VK_2
    K_3 = KeyEvent::VK_3
    K_4 = KeyEvent::VK_4
    K_5 = KeyEvent::VK_5
    K_6 = KeyEvent::VK_6
    K_7 = KeyEvent::VK_7
    K_8 = KeyEvent::VK_8
    K_9 = KeyEvent::VK_9

    #Punctuation
    K_COLON = KeyEvent::VK_COLON
    K_SEMICOLON = KeyEvent::VK_SEMICOLON

    SPECIAL = {
      ":" => "COLON",
      ";" => "SEMICOLON"
    }

    def get(key)
      key = SPECIAL[key] if SPECIAL.include?(key)
      return self.class.const_get("K_#{key}")
    end
  end
end
