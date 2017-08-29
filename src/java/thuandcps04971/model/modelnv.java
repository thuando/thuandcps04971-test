/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import thuandcps04971.javabean.NhanVien;

/**
 *
 * @author Administrator
 */
@Controller
public class modelnv {

    @Autowired
    public static ServletContext context;
    private static String user = "ps04971@thuandcps04971";
    private static String pass = "ThuanDo123***";
    private static String url="jdbc:sqlserver://thuandcps04971.database.windows.net:1433;database=thuandcps04971ass2";

    public modelnv() {

    }

    public static String doingay(String ngay) throws ParseException {
        final DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String dateString1 = ngay;
//      System.out.println("dateString1 = " + dateString1);

        // String ==> Date
        Date date1 = df1.parse(dateString1);

//      System.out.println("date1 = " + date1);
        final DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

        // Date ==> String.
        String dateString2 = df2.format(date1);

//      System.out.println("dateString2 = " + dateString2);
        return dateString2;
    }

    public static List<NhanVien> showProductDG(String tensp) {
        try {

            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = " SELECT Staffs.Id, Staffs.Name, Departs.Name \n"
                    + " FROM Staffs  JOIN Departs \n"
                    + "     ON Staffs.DepartId = Departs.Id ";
            if (tensp.length() > 0) {
                sql += " where Staffs.Id like '%" + tensp + "%'";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<NhanVien> list = new ArrayList<NhanVien>();
            while (rs.next()) {
                int id_all = rs.getInt(1);
                String name_all = rs.getString(2);
                String mapb = rs.getString(3);
                NhanVien sp = new NhanVien(id_all, name_all, mapb);
                list.add(sp);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<NhanVien> showProduct(String tensp) {
        try {

            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "select * from Staffs";
            if (tensp.length() > 0) {
                sql += " where Id like '%" + tensp + "%'";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<NhanVien> list = new ArrayList<NhanVien>();
            while (rs.next()) {
                int id_all = rs.getInt("Id");
                String name_all = rs.getString("Name");
                String gioitinh = rs.getString("Gender");
                String ngaysinh = doingay(rs.getString("Birthday"));
                String anh = rs.getString("Photo");
                String email = rs.getString("Email");
                String sdt = rs.getString("Phone");
                String luong = rs.getString("Salary");
                String chuy = rs.getString("Notes");
                String mapb = rs.getString("DepartId");

                NhanVien sp = new NhanVien(id_all, name_all, gioitinh, ngaysinh, anh, email, sdt, luong, chuy, mapb);
                list.add(sp);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void delete(int id) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = " delete from Records where Staffid=? delete from Staffs where Id=? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, id);
            stm.executeUpdate();
            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void insert(NhanVien us) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "insert into Staffs values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, us.getName());
            stm.setString(2, us.getGioitinh());
            stm.setString(3, us.getSinhnhat());
            stm.setString(4, us.getAnh());
            stm.setString(5, us.getEmail());
            stm.setString(6, us.getSdt());
            stm.setString(7, us.getLuong());
            stm.setString(8, us.getChuy());
            stm.setString(9, us.getMpb());
            stm.executeUpdate();
            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(NhanVien us) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "update Staffs set Name=?,Gender=?,Birthday=?,Photo=?,Email=?,Phone=?,Salary=?,Notes=?,DepartId =? where Id=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, us.getName());
            stm.setString(2, us.getGioitinh());
            stm.setString(3, us.getSinhnhat());
            stm.setString(4, us.getAnh());
            stm.setString(5, us.getEmail());
            stm.setString(6, us.getSdt());
            stm.setString(7, us.getLuong());
            stm.setString(8, us.getChuy());
            stm.setString(9, us.getMpb());
            stm.setInt(10, us.getId());
            stm.executeUpdate();
            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws ParseException {
        
//        try{
//  String path1 = context.getRealPath("/images/")+"123";
//          System.out.println(path1);}
//        catch(Exception e){
//            System.out.println(e);
//        }

        for (int i = 0; i < showProductDG("").size(); i++) {
            System.out.println(showProduct("").get(i).getName());
        }

    }
}
