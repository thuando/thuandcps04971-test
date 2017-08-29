/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import thuandcps04971.javabean.NhanVien;
import thuandcps04971.javabean.phongnhansu;
import thuandcps04971.javabean.user;
import thuandcps04971.model.modelnv;
import thuandcps04971.model.modelpb;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/nhansu")
public class C_phongban {

    @RequestMapping("quanlyns")
    public String quanlypb(ModelMap model) {
        modelpb u_model = new modelpb();
        List<phongnhansu> list = new ArrayList<>();
        list = modelpb.showProduct("");
        model.addAttribute("listacc", list);

        phongnhansu a = new phongnhansu();
        a = list.get(0);
        model.addAttribute("nhanvien", a);

        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProduct("");
        model.addAttribute("listacc1", list1);

        NhanVien a1 = new NhanVien();
        a1 = list1.get(0);
        model.addAttribute("danhsach", a1);
        model.addAttribute("img", a1.getAnh());
        model.addAttribute("ktacc", 2);
        return "view_admin/index";
    }

     @ModelAttribute("GioiTinh")
    public Map<String,String> getMajors1(){
        Map<String,String> GioiTinh = new HashMap<>();
        GioiTinh.put("1", "Nam");
        GioiTinh.put("0", "Nữ");
        return GioiTinh;
    }
    
     @ModelAttribute("phongban")
    public List<phongnhansu> getphongban() {
        List<phongnhansu> phongban = new ArrayList<>();
        modelpb u_model = new modelpb();
        List<phongnhansu> ds = new ArrayList<phongnhansu>();
        ds = modelpb.showProduct("");
        for (phongnhansu cv : ds) {
            phongban.add(cv);
        }
        return phongban;
    }

   @RequestMapping(params = "Edit", method = RequestMethod.POST)
    public String edit(HttpServletRequest request, ModelMap model) {
        String id = request.getParameter("id1");
        String name = request.getParameter("name");
        phongnhansu sv = new phongnhansu(id, name);
        model.addAttribute("nhanvien", sv);

        List<phongnhansu> list = new ArrayList<phongnhansu>();
        list = modelpb.showProduct("");
        model.addAttribute("listacc", list);
        model.addAttribute("ktacc", 2);

        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProduct("");
        model.addAttribute("listacc1", list1);

        NhanVien a1 = new NhanVien();
        a1 = list1.get(0);
        model.addAttribute("danhsach", a1);
        model.addAttribute("img", a1.getAnh());
        return "view_admin/index";
    }

    @RequestMapping(params = "Delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest request, ModelMap model) {
        String id = request.getParameter("id1");
        modelpb.delete(id);
        List<phongnhansu> list = new ArrayList<phongnhansu>();
        list = modelpb.showProduct("");
        model.addAttribute("listacc", list);
        phongnhansu a = new phongnhansu();
        a = list.get(0);
        model.addAttribute("nhanvien", a);

        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProduct("");
        model.addAttribute("listacc1", list1);

        NhanVien a1 = new NhanVien();
        a1 = list1.get(0);
        model.addAttribute("danhsach", a1);
        model.addAttribute("img", a1.getAnh());
        model.addAttribute("ktacc", 2);
        return "view_admin/index";
    }

    @RequestMapping(params = "btnUpdate")
    public String update(@ModelAttribute("dautien") phongnhansu userupdate, ModelMap model) {
        modelpb.update(userupdate);
        List<phongnhansu> list = new ArrayList<phongnhansu>();
        list = modelpb.showProduct("");
        model.addAttribute("listacc", list);
        phongnhansu a = new phongnhansu();
        a = list.get(0);
        model.addAttribute("nhanvien", a);
        model.addAttribute("ktacc", 2);

        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProduct("");
        model.addAttribute("listacc1", list1);

        NhanVien a1 = new NhanVien();
        a1 = list1.get(0);
        model.addAttribute("danhsach", a1);
        model.addAttribute("img", a1.getAnh());
        return "view_admin/index";
    }

    @RequestMapping(params = "btnInsert")
    public String insert(@ModelAttribute("dautien") phongnhansu us, ModelMap model) {
        modelpb.insert(us);
        List<phongnhansu> list = new ArrayList<phongnhansu>();
        list = modelpb.showProduct("");
        model.addAttribute("listacc", list);
        phongnhansu a = new phongnhansu();
        a = list.get(0);
        model.addAttribute("nhanvien", a);
        model.addAttribute("ktacc", 2);

        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProduct("");
        model.addAttribute("listacc1", list1);

        NhanVien a1 = new NhanVien();
        a1 = list1.get(0);
        model.addAttribute("danhsach", a1);
        model.addAttribute("img", a1.getAnh());
        return "view_admin/index";
    }
}
