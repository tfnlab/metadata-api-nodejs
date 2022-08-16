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

MatrixToImageWriter.writeToFile(matrixprivate, pathprivate.substring(pathprivate.lastIndexOf('.') + 1), new File(pathprivate));

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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Play - TFNLab</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Play.TFNLab.com</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="https://tfnlab.com">TFNLab.com</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                              <li class="nav-item"><a class="nav-link" href="https://play.tfnlab.com/meta.jsp">Wallet</a></li>
                                <li class="nav-item"><a class="nav-link" href="https://metagascar.tfnlab.com">Metagascar</a></li>
                                <li class="nav-item"><a class="nav-link" href="index.mainnet.html">Mainnet</a></li>
                                <li class="nav-item"><a class="nav-link" href="https://opensea.io/collection/tfnlab">OpenSea</a></li>
                                <li class="nav-item"><a class="nav-link" href="https://etherscan.io/token/0xa881bf6e9618ac86502a64e83010c88869aa0d97">Etherscan</a></li>
                                <li class="nav-item"><a class="nav-link" href="https://twitter.com/tfnlab">Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                  <BR><BR>
                  Public Key<BR>
                  <%=str%><BR>
                  <img src="meta.pub.jsp?key=<%=str%>" /><BR>
                  Private Key <BR>
                  <%=strprivate%><BR>
                  <img src="meta.pub.jsp?key=<%=strprivate%>" /><BR>

                  <a href="https://play.tfnlab.com/meta.pdf.jsp?private=<%=strprivate%>&public=<%=str%>" >Download PDF</a>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
