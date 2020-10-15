package com.arjjs.ccm.tool;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.imageio.ImageIO;

public class Test {

	public static void main(String[] args) {
	    String date = "2020-02";
	    SimpleDateFormat sdff = new SimpleDateFormat("yyyy-MM");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date1 = sdff.parse(date);
            String date2 = date1.getTime()+"";
            System.out.println(date2);
            Date date3 = new Date(Long.parseLong(date2));
            String date4 = sdf.format(date3);
            System.out.println(date4);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
            Date start = calendar.getTime();
            String dateStart = sdf.format(start);
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            Date end = calendar.getTime();
            String dateEnd = sdf.format(end);
            System.out.println(dateStart);
            System.out.println(dateEnd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	//图片反色
    public static BufferedImage img_inverse(BufferedImage imgsrc) {
        try {
            //创建一个不带透明度的图片
            BufferedImage back=new BufferedImage(imgsrc.getWidth(), imgsrc.getHeight(),BufferedImage.TYPE_INT_RGB);
            int width = imgsrc.getWidth();  
            int height = imgsrc.getHeight();  
            for (int i = 0; i < height; i++) { 
                for (int j = 0; j < width; j++) {  
                    int pixel = imgsrc.getRGB(j, i); 
//                    System.out.println(pixel);
                    back.setRGB(j,i,0xFFFFFF-pixel-120968);
                }
            }
            return back;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
  //读取图片
    public static BufferedImage file2img(String imgpath) {
        try {
            BufferedImage bufferedImage=ImageIO.read(new File(imgpath));
            return bufferedImage;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    //保存图片,extent为格式，"jpg"、"png"等
    public static void img2file(BufferedImage img,String extent,String newfile) {
        try {
            ImageIO.write(img, extent, new File(newfile));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
}
