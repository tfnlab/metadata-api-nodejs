<%@ page language="java" import="org.apache.commons.io.output.*,java.io.*,java.util.*, javax.servlet.*, org.apache.commons.io.*, java.nio.charset.Charset,java.util.Map,java.util.HashMap,java.io.IOException,com.google.zxing.BarcodeFormat,com.google.zxing.EncodeHintType,com.google.zxing.MultiFormatWriter,com.google.zxing.NotFoundException,com.google.zxing.WriterException,com.google.zxing.client.j2se.MatrixToImageWriter,com.google.zxing.common.BitMatrix,com.google.zxing.qrcode.decoder.ErrorCorrectionLevel,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
//main() method
//data that we want to store in the QR code

String pdfFileName = "/opt/tomcat/webapps/pdfwallet/GFG.pdf";
File pdfFile = new File(pdfFileName);

response.setContentType("application/pdf");
response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
response.setContentLength((int) pdfFile.length());

FileInputStream fileInputStream = new FileInputStream(pdfFile);
OutputStream responseOutputStream = response.getOutputStream();
int bytes;
while ((bytes = fileInputStream.read()) != -1) {
  responseOutputStream.write(bytes);
}
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
