package eschool.attendance.function;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import eschool.attendance.model.AttendanceReport;
import eschool.attendance.service.Service;

/**
 * Servlet implementation class AttendanceReportS
 */
@WebServlet("/AttendanceReportS")
public class AttendanceReportS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceReportS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		int yr = Integer.parseInt(request.getParameter("class"));
		String section = request.getParameter("section");
		java.sql.Date dte = java.sql.Date.valueOf(request.getParameter("date"));
		ArrayList<AttendanceReport> report = Service.attendanceReport(yr, section, dte);
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();
			Paragraph p1 = new Paragraph(" eSchool ",
					FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD, new BaseColor(255, 0, 0)));

			Paragraph p2 = new Paragraph("Student Attendance Report",
					FontFactory.getFont(FontFactory.HELVETICA, 16, new BaseColor(0, 0, 0)));
			
			Paragraph p3 = new Paragraph("Class - " + yr + " Section - " + section,
					FontFactory.getFont(FontFactory.HELVETICA, 16, new BaseColor(0, 0, 0)));
			
			Paragraph p4 = new Paragraph(request.getParameter("date"),
					FontFactory.getFont(FontFactory.HELVETICA, 16, new BaseColor(0, 0, 0)));
			
			Paragraph p5 = new Paragraph("\n\n\n");
			p1.setAlignment(Element.ALIGN_CENTER);
			p2.setAlignment(Element.ALIGN_CENTER);
			p3.setAlignment(Element.ALIGN_CENTER);
			p4.setAlignment(Element.ALIGN_CENTER);
			document.add(p1);
			document.add(p2);
			document.add(p3);
			document.add(p4);
			document.add(p5);
			PdfPTable t = new PdfPTable(2);
			/*float widths[] = { 3, 6, 3, 3, 4, 3, 3, 3, 3 };
			t.setWidths(widths);
			t.setHeaderRows(1);
			t.setTotalWidth(100f);*/

			// Add table header row
			PdfPCell c1 = new PdfPCell(new Phrase("Name", FontFactory.getFont(FontFactory.HELVETICA, 14)));
			c1.setBorderWidth((float) 0.25);
			c1.setBackgroundColor(new BaseColor(232, 232, 232));
			c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			t.addCell(c1);

			c1 = new PdfPCell(new Phrase("Status", FontFactory.getFont(FontFactory.HELVETICA, 14)));
			c1.setBorderWidth(0.25f);
			c1.setBackgroundColor(new BaseColor(232, 232, 232));
			c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			t.addCell(c1);

			
			// Add the table details row
			for(AttendanceReport r:report) {
				Phrase ph;
				c1 = new PdfPCell();
				c1.setPadding(10);
				c1.setBorderWidth((float) 0.25);
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				ph = new Phrase(r.getName(), FontFactory.getFont(FontFactory.HELVETICA, 12));
				c1.addElement(ph);
				t.addCell(c1);

				c1 = new PdfPCell();
				c1.setPadding(10);
				c1.setBorderWidth((float) 0.25);
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				ph = new Phrase(r.getStatus(), FontFactory.getFont(FontFactory.HELVETICA, 12));
				c1.addElement(ph);
				t.addCell(c1);
			}

			document.add(t);
			document.close();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
