package com.alipay.util;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.log4j.Logger;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.NumberFormat;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.Number;

public class SimpleExcelWrites {
    // private static int width[] = {15, 15, 15};
    private int width = 20;
    private int page = 0;
    private int rows = 0;
    private Logger logger = Logger
            .getLogger(SimpleExcelWrites.class);
    
    public void createExcel1(OutputStream os, String header1[], String rs1[][])
            throws WriteException, IOException {
        WritableWorkbook workbook = null;
        // 创建工作薄
        workbook = Workbook.createWorkbook(os);
        String header[] = null;
        String rs[][] =null;
        try {
        	for( page=0; page<1 ; page++){
        		String sheetName = "";
        		if(page==0){
            		 header = header1;
                     rs = rs1;
                     sheetName = "订单信息";
        		}
                // 创建新的一页
                WritableSheet sheet = workbook.createSheet(sheetName, page);
                WritableCellFormat titleFormate = new WritableCellFormat();//生成一个单元格样式控制对象
                
                titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
                 titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向
                 titleFormate.setWrap(true); //设置自动换行
                 //表头样式
                 WritableFont wf_title = new WritableFont(WritableFont.ARIAL, 10,  WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,  
                            jxl.format.Colour.BLACK); // 定义格式 字体 下划线 斜体 粗体 颜色  
                 WritableCellFormat wcf_title = new WritableCellFormat(wf_title); // 单元格定义  
                 wcf_title.setBackground(jxl.format.Colour.GRAY_25); // 设置单元格的背景颜色  
                 wcf_title.setAlignment(jxl.format.Alignment.CENTRE); // 设置对齐方式  
                 wcf_title.setBorder(Border.ALL, BorderLineStyle.THIN,jxl.format.Colour.BLACK);

                // 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
                // 填充表头
                for (int i = 0; i < header.length; i++) {
                    sheet.setColumnView(i, width);// 根据内容自动设置列宽
                    Label cell = new Label(i, 0, header[i],wcf_title);
                    sheet.addCell(cell);
                }
                // 填充主体
                rows = 0;
                for (int i = 0; i < rs.length; i++) {
                    if(rs[i] != null){
                    	rows=rows+1;
                    	for (int j = 0; j < rs[i].length; j++) {
                            if(isNum(rs[i][j])){
                                //long num=Long.parseLong(rs[i][j]);
                                  //浮点数据
                                //Number number = new Number(j,i+1,num,titleFormate);
                                //sheet.addCell(number);
                                Label label = new Label(j, rows, rs[i][j],titleFormate);
                                sheet.addCell(label);
                            }else if(isFloat(rs[i][j])){
                                float num=Float.parseFloat(rs[i][j]);
                                  //浮点数据
                                 //保留两位小数，如果小数位不足两位，用0填充
                                  NumberFormat fivedps1 = new NumberFormat("#.00");
                                  WritableCellFormat fivedpsFormat1 = new WritableCellFormat(fivedps1);
                                    fivedpsFormat1.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
                                    fivedpsFormat1.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向
                                    fivedpsFormat1.setWrap(true); //设置自动换行
                                Number number = new Number(j,rows,num,fivedpsFormat1);
                                sheet.addCell(number);
                            }else{
                                Label label = new Label(j, rows, rs[i][j],titleFormate);
                                sheet.addCell(label);
                            }
                            
                            
                        }
                        if (rows > 60000) {
                            page++;
                            rows = 0;
                            sheet = workbook.createSheet("Export" + page, page);
                            for (int j = 0; j < rs[i].length; j++) {
                                if(isNum(rs[i][j])){
                                    long num=Long.parseLong(rs[i][j]);
                                      //浮点数据
                                    Number number = new Number(j,i + 1,num,titleFormate);
                                    sheet.addCell(number);
                                }else if(isFloat(rs[i][j])){
                                    float num=Float.parseFloat(rs[i][j]);
                                      //浮点数据
                                    Number number = new Number(j,i+1,num,titleFormate);
                                    sheet.addCell(number);
                                }else{
                                    Label label = new Label(j, i + 1, rs[i][j],titleFormate);
                                    sheet.addCell(label);
                                }
                            }
                        }
                    }
                }
            }
            // 把创建的内容写入到输出流中，并关闭输出流
            workbook.write();

        } catch (IOException e) {
            logger.error(e);
        } finally {
            if (workbook != null)
                workbook.close();
            if (os != null)
                os.close();
        }

    }

     public static boolean isNum(String str) {
         if(str.contains("e")||str.contains("E")){
             return false;
         }
            try {
                 Long.parseLong(str);
                return true;
            } catch (Exception e) {
                return false;
            }
        }
     public static boolean isFloat(String str) {
          if(str.contains("e")||str.contains("E")){
             return false;
           }
            try {
                Float.parseFloat(str);
                return true;
            } catch (Exception e) {
                
                return false;
            }
        }
}