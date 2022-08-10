<%@ page language="java" import="org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
      String cmdarg = request.getParameter("shirt") + " ";
      cmdarg = cmdarg + request.getParameter("body") + " ";
      cmdarg = cmdarg + request.getParameter("smile") + " ";
      cmdarg = cmdarg + request.getParameter("gum") + " ";
      cmdarg = cmdarg + request.getParameter("lazers") + " ";
      cmdarg = cmdarg + request.getParameter("hats") + " ";
      cmdarg = cmdarg + request.getParameter("earring") + " ";
      cmdarg = cmdarg + request.getParameter("chain") + " ";
      Process p = new ProcessBuilder("ruby", "/opt/tomcat/webapps/tfnlab.rb", cmdarg, "").start();
      String stderr = IOUtils.toString(p.getErrorStream(), Charset.defaultCharset());
      String stdout = IOUtils.toString(p.getInputStream(), Charset.defaultCharset());
      ServletContext cntx= request.getServletContext();
      // Get the absolute path of the image
      String filename = "/opt/tomcat/webapps/images/" + request.getParameter("shirt") + "_"  + request.getParameter("smile") + "_"  + request.getParameter("gum") + "_" + request.getParameter("lazers") + "_" + request.getParameter("hats") + "_" + request.getParameter("earring") + "_" + request.getParameter("chain") +".png";
      // retrieve mimeType dynamically
      String mime = cntx.getMimeType(filename);
      if (mime == null) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        return;
      }

      response.setContentType(mime);
      File file = new File(filename);

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
