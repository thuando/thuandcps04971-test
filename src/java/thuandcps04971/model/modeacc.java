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
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import thuandcps04971.javabean.NhanVien;
import thuandcps04971.javabean.user;

/**
 *
 * @author Administrator
 */
public class modeacc {
    private static String user = "ps04971@thuandcps04971";
    private static String pass = "ThuanDo123***";
    private static String url="jdbc:sqlserver://thuandcps04971.database.windows.net:1433;database=thuandcps04971ass2";
    public  modeacc(){
        
    }
    public static  String KT_lg(String user_lg,String pass_lg){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = " select Fullname from Users where Username = '"+user_lg+"' and Password = '"+pass_lg+"' ";
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                if(!rs.getString("Fullname").equals("")){
                    return rs.getString("Fullname");
                    
                }
            }
        }catch(Exception e){
            e.printStackTrace();
             System.out.println("!23");
             return "";
        }
        return "";
    }
    
     public static List<user> showProduct(String tensp){
        try{
            
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "select * from Users";
            if(tensp.length() > 0){
                sql += " where Username like '%"+tensp+"%'";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<user> list = new ArrayList<user>();
            while(rs.next()){
                String user_all = rs.getString("Username");
                String pass_all = rs.getString("Password");
                String full_all = rs.getString("Fullname");
                user sp = new user(user_all, pass_all, full_all);
                list.add(sp);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
     public static void delete(String name){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "delete from Users where Username=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void insert(user us){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "insert into Users values(?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, us.getName());
            stm.setString(2, us.getPass());
            stm.setString(3, us.getFull());
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void update(user uu){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "update Users set Password=?, Fullname=? where Username=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, uu.getPass());
            stm.setString(2, uu.getFull());
             stm.setString(3, uu.getName());
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
     
    public static void main(String[] args) {
//        insert(new user("name","123","123"));
//        for(int i = 0;i<showProduct("").size();i++){
//        System.out.println(showProduct("").get(i).getName());
Vector a = new Vector();
NhanVien nv = new NhanVien(1, "123");
NhanVien nv1 = new NhanVien(2, "3333");
NhanVien nv2 = new NhanVien(3, "3333");
a.add(nv);
a.add(nv1);
a.add(nv2);
  for(int i = 0;i<a.size();i++){
           nv = (NhanVien) a.get(i);
           System.out.println(nv.getId());
        }
    }
}
