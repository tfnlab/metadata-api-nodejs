<%@ page language="java" import="org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
      String filename = "/opt/tomcat/webapps/imagesmdyc/" + request.getParameter("buttplug") + "_"  + request.getParameter("chain") + "_"  + request.getParameter("clothes") + "_"  + request.getParameter("earring") + "_" + request.getParameter("eyes") + "_" + request.getParameter("hat") + "_" + request.getParameter("mouth")  + ".png";
      File file = new File(filename);
      if(!file.exists()){
        String cmdarg = request.getParameter("buttplug") + " ";
        cmdarg = cmdarg + request.getParameter("chain") + " ";
        cmdarg = cmdarg + request.getParameter("clothes") + " ";
        cmdarg = cmdarg + request.getParameter("earring") + " ";
        cmdarg = cmdarg + request.getParameter("eyes") + " ";
        cmdarg = cmdarg + request.getParameter("hat") + " ";
        cmdarg = cmdarg + request.getParameter("mouth") + " ";
        Process p = new ProcessBuilder("ruby", "/opt/tomcat/webapps/tfnlabmdyc.rb", cmdarg, "").start();
        String stderr = IOUtils.toString(p.getErrorStream(), Charset.defaultCharset());
        String stdout = IOUtils.toString(p.getInputStream(), Charset.defaultCharset());
      }
      ServletContext cntx= request.getServletContext();
      // Get the absolute path of the image
      // retrieve mimeType dynamically
      String mime = cntx.getMimeType(filename);
      if (mime == null) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        return;
      }
      response.setContentType(mime);
      BufferedImage image = ImageIO.read(file);
      ImageIO.write(image, "PNG", response.getOutputStream());

 //     response.setContentLength((int)file.length());

//      FileInputStream in = new FileInputStream(file);
//      OutputStream outpng = response.getOutputStream();

      // Copy the contents of the file to the output stream
//       byte[] buf = new byte[1024];
//       int count = 0;
//       while ((count = in.read(buf)) >= 0) {
//         outpng.write(buf, 0, count);
//      }
//    outpng.close();
//    in.close();
%>
