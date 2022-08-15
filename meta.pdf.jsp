<%@ page language="java" import="java.io.IOException,java.io.File,com.itextpdf.layout.element.Paragraph,com.itextpdf.layout.element.ListItem,com.itextpdf.layout.element.List,com.itextpdf.layout.Document,com.itextpdf.kernel.pdf.PdfWriter,com.itextpdf.kernel.pdf.PdfDocument,com.itextpdf.kernel.font.PdfFontFactory,com.itextpdf.kernel.font.PdfFont,com.itextpdf.io.font.constants.StandardFonts"%>
<%
//main() method
//data that we want to store in the QR code

PdfWriter writer = new PdfWriter("/opt/tomcat/webapps/iTextHelloWorld.pdf");


// Creating a PdfDocument
PdfDocument pdfDoc = new PdfDocument(writer);

// Adding a new page
pdfDoc.addNewPage();

// Creating a Document
Document document = new Document(pdfDoc);

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
