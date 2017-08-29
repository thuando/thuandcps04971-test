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
import thuandcps04971.javabean.phongnhansu;

/**
 *
 * @author Administrator
 */
public class modelpb {
    private static String user = "ps04971@thuandcps04971";
    private static String pass = "ThuanDo123***";
    private static String url="jdbc:sqlserver://thuandcps04971.database.windows.net:1433;database=thuandcps04971ass2";
    public  modelpb(){
        
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
    
     public static List<phongnhansu> showProduct(String tensp){
        try{
            
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "select * from Departs";
            if(tensp.length() > 0){
                sql += " where Id like '%"+tensp+"%'";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<phongnhansu> list = new ArrayList<phongnhansu>();
            while(rs.next()){
                String id_all = rs.getString("Id");
                String name_all = rs.getString("Name");
                phongnhansu sp = new phongnhansu(id_all, name_all);
                list.add(sp);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
     public static void delete(String id){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = " delete from Departs where Id = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void insert(phongnhansu us){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "insert into Departs values(?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, us.getId());
            stm.setString(2, us.getName());
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void update(phongnhansu uu){
        try{
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(url, user, pass);
            String sql = "update Departs set Name=? where Id=?";
            PreparedStatement stm = con.prepareStatement(sql);
             stm.setString(1, uu.getName());
             stm.setString(2, uu.getId());
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
     
    public static void main(String[] args) {
//        insert(new phongnhansu("1","123"));
//        for(int i = 0;i<showProduct("").size();i++){
//        System.out.println(showProduct("").get(i).getName());
//        }
String name="thuận||10009";
String[] str = name.split("[||]");
        System.out.println(str[0]+" tiếp theo "+str[2]);
    }
}

