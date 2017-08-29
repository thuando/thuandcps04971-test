/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.javabean;

/**
 *
 * @author Administrator
 */
public class NhanVien {
    private int id;
    private String name;
    private String gioitinh;
    private String sinhnhat;
    private String anh;
    private String email;
    private String sdt;
    private String luong;
    private String chuy;
    private String mpb;
     private String tenchucvu;
     
    public NhanVien() {
    }

    public NhanVien(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public NhanVien(int id, String name, String gioitinh, String sinhnhat, String anh, String email, String sdt, String luong, String chuy, String mpb) {
        this.id = id;
        this.name = name;
        this.gioitinh = gioitinh;
        this.sinhnhat = sinhnhat;
        this.anh = anh;
        this.email = email;
        this.sdt = sdt;
        this.luong = luong;
        this.chuy = chuy;
        this.mpb = mpb;
    }

    public NhanVien(int id, String name, String tenchucvu) {
        this.id = id;
        this.name = name;
        this.tenchucvu = tenchucvu;
    }

    
    
    
    public String getTenchucvu() {
        return tenchucvu;
    }

    public void setTenchucvu(String tenchucvu) {
        this.tenchucvu = tenchucvu;
    }

    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getSinhnhat() {
        return sinhnhat;
    }

    public void setSinhnhat(String sinhnhat) {
        this.sinhnhat = sinhnhat;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getLuong() {
        return luong;
    }

    public void setLuong(String luong) {
        this.luong = luong;
    }

    public String getChuy() {
        return chuy;
    }

    public void setChuy(String chuy) {
        this.chuy = chuy;
    }

    public String getMpb() {
        return mpb;
    }

    public void setMpb(String mpb) {
        this.mpb = mpb;
    }

   
}
