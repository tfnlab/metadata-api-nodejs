<%@ page language="java" import="java.io.IOException,java.io.File,com.itextpdf.layout.element.Paragraph,com.itextpdf.layout.element.ListItem,com.itextpdf.layout.element.List,com.itextpdf.layout.Document,com.itextpdf.kernel.pdf.PdfWriter,com.itextpdf.kernel.pdf.PdfDocument,com.itextpdf.kernel.font.PdfFontFactory,com.itextpdf.kernel.font.PdfFont,com.itextpdf.io.font.constants.StandardFonts"%>
<%
//main() method
//data that we want to store in the QR code

PdfWriter writer = new PdfWriter("/opt/tomcat/webapps/iTextHelloWorld.pdf");

//Initialize PDF document
PdfDocument pdf = new PdfDocument(writer);

// Initialize document
Document document = new Document(pdf);

// Create a PdfFont
PdfFont font = PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
// Add a Paragraph
document.add(new Paragraph("iText is:").setFont(font));
// Create a List
List list = new List()
    .setSymbolIndent(12)
    .setListSymbol("\u2022")
    .setFont(font);
// Add ListItem objects
list.add(new ListItem("Never gonna give you up"))
    .add(new ListItem("Never gonna let you down"))
    .add(new ListItem("Never gonna run around and desert you"))
    .add(new ListItem("Never gonna make you cry"))
    .add(new ListItem("Never gonna say goodbye"))
    .add(new ListItem("Never gonna tell a lie and hurt you"));
// Add the list
document.add(list);

//Close document
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
