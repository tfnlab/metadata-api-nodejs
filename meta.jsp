<%@ page language="java" import="java.io.*,java.util.*, javax.servlet.*, org.apache.commons.io.*, java.nio.charset.Charset,java.util.Map,java.util.HashMap,java.io.IOException,com.google.zxing.BarcodeFormat,com.google.zxing.EncodeHintType,com.google.zxing.MultiFormatWriter,com.google.zxing.NotFoundException,com.google.zxing.WriterException,com.google.zxing.client.j2se.MatrixToImageWriter,com.google.zxing.common.BitMatrix,com.google.zxing.qrcode.decoder.ErrorCorrectionLevel,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
//main() method
//data that we want to store in the QR code

String str= "THE HABIT OF PERSISTENCE IS THE HABIT OF VICTORY.";
//path where we want to get QR Code
String path = "/opt/tomcat/webapps/imagesqr/Quote.png";
//Encoding charset to be used
String charset = "UTF-8";
Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
//generates QR code with Low level(L) error correction capability
hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
//invoking the user-defined method that creates the QR code
//generateQRcode(str, path, charset, hashMap, 200, 200);//increase or decrease height and width accodingly
Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/uploads/address.py").start();
String stderrweb3 = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
String stdoutweb3 = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());

str = stdoutweb3.substring(stdoutweb3.indexOf("Address") + 9, stdoutweb3.length()).trim();

BitMatrix matrix = new MultiFormatWriter().encode(new String(str.getBytes(charset), charset), BarcodeFormat.QR_CODE, 200, 200);
MatrixToImageWriter.writeToFile(matrix, path.substring(path.lastIndexOf('.') + 1), new File(path));


File file = new File(path);
ServletContext cntx= request.getServletContext();
// Get the absolute path of the image
// retrieve mimeType dynamically
String mime = cntx.getMimeType(path);
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
