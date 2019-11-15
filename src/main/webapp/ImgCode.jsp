<%@page import="java.util.Random"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="image/jpeg" %>
<%
   int width = 100;
   int height = 50;
   
   
   BufferedImage buffImg = 
		   new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
   
   Graphics2D g2 = buffImg.createGraphics();
   
   //设置颜色
   g2.setColor(Color.WHITE);
   g2.fillRect(0, 0, width, height);
   
   g2.setColor(Color.BLACK);
   g2.drawRect(0, 0, width-2, height-2);
   
   
   Font font = new Font("Times New Roman",Font.BOLD,20);
   g2.setFont(font);
   
   int r =0,g=0,b=0;
   String fs[] ={"Times New Roman","Trebuchet MS","Verdana","Tahoma"};
   Random random = new Random();
   StringBuffer sb = new StringBuffer();
   for(int i=0;i<fs.length;i++){
	   int a = random.nextInt(10);
	   r = random.nextInt(150);
	   g = random.nextInt(50);
	   b = random.nextInt(80);
	   font = new Font(fs[random.nextInt(fs.length)],Font.BOLD,20);
	   g2.setFont(font);
	   g2.setColor(new Color(r,g,b));
	   g2.drawString(a+"", 18*(i+1), 30);
	   sb.append(a);
   }
   
   //使用会话session传递验证码
   session.setAttribute("loginCode", sb.toString());
   
   
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Cache-Control","no-cache");
   response.setDateHeader("Expries", 0);
   response.setContentType("image/jpeg");
   
   ServletOutputStream sos = response.getOutputStream();
   ImageIO.write(buffImg, "jpeg", sos);
   
   //防止页面的执行的错误
   sos.close();
   out.clear();
   out = pageContext.pushBody();

%>
