package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/admin/generateReport")
public class GenerateReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sql = request.getParameter("query");
        final String regex = ".*(UPDATE|DELETE|CREATE|ALTER|TRUNCATE|COMMENT|RENAME|INSERT|MERGE|CALL|LOCK|DROP).*";

        final Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
        final Matcher matcher = pattern.matcher(sql);

        if(!sql.isEmpty() && !matcher.find()){



            String filename="PICT CSI Report";


            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet("Invoice Details");
            int rownum = 0;
            int cellNo = 0;

            try(Connection connection = DatabaseConnection.getConnection()) {
                PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

                ResultSet resultSet = statement.executeQuery();

                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();

                Row header = sheet.createRow(rownum++);
                for(int i = 1;i<=columnCount;i++){
                    header.createCell(cellNo++).setCellValue(metaData.getColumnName(i));
                }


                while (resultSet.next()) {
                    cellNo = 0;
                    Row row = sheet.createRow(rownum++);

                    for(int i = 1;i<=columnCount;i++){
                        String column_type = metaData.getColumnClassName(i);
                        if(!column_type.equals("[B"))
                            row.createCell(cellNo++).setCellValue(resultSet.getString(i));
                        else {
                            row.createCell(cellNo++).setCellValue("");
                        }
                    }
                }


                for(int count = 0;count<cellNo;count++){
                    sheet.autoSizeColumn(count);
                }

                response.setHeader("Content-Disposition", "attachment; filename='"+filename+".xls'");
                response.setContentType("application/vnd.ms-excel");
                OutputStream stream = response.getOutputStream();
                workbook.write(stream);
                stream.flush();

                stream.close();

//                response.sendRedirect("/admin/advanced_report.jsp");

            } catch (SQLException e) {
//                e.printStackTrace();
                response.sendRedirect("/admin/advanced_report.jsp?error="+e.getMessage());
            } catch (Exception e){
                e.printStackTrace();
                response.sendRedirect("/admin/advanced_report.jsp?error="+"Unknown Error or invalid query");
            }


        }else{
            response.sendRedirect("/admin/advanced_report.jsp?error="+"Query may not contain update operations");

        }


    }


}
