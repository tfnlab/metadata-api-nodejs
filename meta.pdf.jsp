<%@ page language="java" import="com.itextpdf.text.Font,com.itextpdf.text.FontFactory,com.itextpdf.kernel.pdf.PdfWriter,com.itextpdf.layout.Document,org.apache.commons.io.output.*,java.io.*,java.util.*, javax.servlet.*, org.apache.commons.io.*, java.nio.charset.Charset,java.util.Map,java.util.HashMap,java.io.IOException,com.google.zxing.BarcodeFormat,com.google.zxing.EncodeHintType,com.google.zxing.MultiFormatWriter,com.google.zxing.NotFoundException,com.google.zxing.WriterException,com.google.zxing.client.j2se.MatrixToImageWriter,com.google.zxing.common.BitMatrix,com.google.zxing.qrcode.decoder.ErrorCorrectionLevel,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
//main() method
//data that we want to store in the QR code

Document document = new Document();
PdfWriter.getInstance(document, new FileOutputStream("/opt/tomcat/webapps/iTextHelloWorld.pdf"));

document.open();
Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
Chunk chunk = new Chunk("Hello World", font);




document.add(chunk);
document.close();
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
