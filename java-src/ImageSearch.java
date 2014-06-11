import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;

public class ImageSearch {

  private int x;
  private int y;

  public byte[] byte_array(BufferedImage image) {
    ByteArrayOutputStream os = new ByteArrayOutputStream();
    try {
      ImageIO.write(image, "png", os);
      return os.toByteArray();
    } catch (Exception e) {
      return null;
    }
  }

  public void searchImage(BufferedImage img1, BufferedImage img2) {
    int w = img2.getWidth();
    int h = img2.getHeight();
    this.x=-1;
    this.y=-1;

    int firstpix = img2.getRGB(0, 0);
    int midpix = img2.getRGB(w/2, h/2);
    byte[] b2 = this.byte_array(img2);
    byte[] b1;
    BufferedImage find;
    for (int x=0; x<img1.getWidth()-w; x++){
      for (int y=0; y<img1.getHeight()-h; y++){
        if (firstpix == img1.getRGB(x, y) && midpix == img1.getRGB(x+w/2, y+h/2)){
          find = img1.getSubimage(x, y, w, h);
          b1 = this.byte_array(find);

          if (java.util.Arrays.equals(b1, b2)){
            this.x = x+w/2;
            this.y = y+h/2;
            break;
          }

        }
      }
    }

  }

  public int getX(){
    return x;
  }

  public int getY(){
    return y;
  }

  public int[][] rgbArray(BufferedImage image) {
    int w = image.getWidth();
    int h = image.getHeight();
    int rgb[][] = new int[w][h];
    for (int x=0; x<w; x++) {
      for (int y=0; y<h; y++) {
        rgb[x][y] = image.getRGB(x, y);
      } 
    }

    return rgb;
  }

  public ImageSearch() {

  }

}
