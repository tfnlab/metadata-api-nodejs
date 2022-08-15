<%@ page language="java" import="org.apache.commons.io.output.*,java.io.*,java.util.*, javax.servlet.*, org.apache.commons.io.*, java.nio.charset.Charset,java.util.Map,java.util.HashMap,java.io.IOException,com.google.zxing.BarcodeFormat,com.google.zxing.EncodeHintType,com.google.zxing.MultiFormatWriter,com.google.zxing.NotFoundException,com.google.zxing.WriterException,com.google.zxing.client.j2se.MatrixToImageWriter,com.google.zxing.common.BitMatrix,com.google.zxing.qrcode.decoder.ErrorCorrectionLevel,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
//main() method
//data that we want to store in the QR code

String str= "THE HABIT OF PERSISTENCE IS THE HABIT OF VICTORY.";
//path where we want to get QR Code
Process pweb3 = new ProcessBuilder("python3", "/opt/tomcat/webapps/uploads/address.py").start();
String stderrweb3 = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
String stdoutweb3 = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());

String strprivate = stdoutweb3.substring(stdoutweb3.indexOf("THIS:") + 6, stdoutweb3.indexOf("Address")).trim();
str = stdoutweb3.substring(stdoutweb3.indexOf("Address") + 9, stdoutweb3.length()).trim();

String path = "/opt/tomcat/webapps/imagesqr/" + str + ".png";
String pathprivate = "/opt/tomcat/webapps/imagesqr/" + strprivate + ".png";
//Encoding charset to be used

String charset = "UTF-8";

Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);


Map<EncodeHintType, ErrorCorrectionLevel> hashMapprivate = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
hashMapprivate.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

BitMatrix matrix = new MultiFormatWriter().encode(new String(str.getBytes(charset), charset), BarcodeFormat.QR_CODE, 200, 200);

BitMatrix matrixprivate = new MultiFormatWriter().encode(new String(strprivate.getBytes(charset), charset), BarcodeFormat.QR_CODE, 200, 200);

MatrixToImageWriter.writeToFile(matrix, path.substring(path.lastIndexOf('.') + 1), new File(path));

MatrixToImageWriter.writeToFile(matrixprivate, pathprivate.substring(pathprivate.lastIndexOf('.') + 1), new File(path));

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
<%=str%><BR>
<img src="meta.pub.jsp?key=<%=str%>" /><BR>
<%=strprivate%><BR>
<img src="meta.pub.jsp?key=<%=strprivate%>" /><BR>
