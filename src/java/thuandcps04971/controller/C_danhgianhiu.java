/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import entity.Record;
import entity.Record1;
import entity.Staff;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import thuandcps04971.javabean.NhanVien;
import thuandcps04971.model.modelnv;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/danhgianhiu")
public class C_danhgianhiu {

    Vector a = new Vector();

    @Autowired
    SessionFactory factory;

    @RequestMapping(params = "table")
    public String insert(ModelMap model,
            @RequestParam("name") String name) {

        String[] str = name.split("[||]");

        if (!name.equals("")) {
            NhanVien nv = new NhanVien(Integer.parseInt(str[2]), str[0]);
            a.add(nv);
            modelnv u_model1 = new modelnv();
            List<NhanVien> list1 = new ArrayList<>();
            list1 = modelnv.showProductDG("");
            model.addAttribute("listacc", list1);
            model.addAttribute("a", a);
            model.addAttribute("ktacc", 6);
            return "view_admin/index";
        }
        model.addAttribute("kt", "");
        model.addAttribute("ktacc", 6);
        return "view_admin/index";
    }

   
     @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, 
            @RequestParam("radio") String radio,
            @RequestParam("reason") String reason
    ) {
         Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Record1 re = null;
          try {
        for(int i = 0;i<a.size();i++){
            NhanVien nv = (NhanVien) a.get(i);
        re= new Record1( Integer.parseInt(radio), reason,nv.getId());
        re.setDate(new Date());
        session.save(re);
        
        }
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
            a =  new Vector();
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại cau hình !"+e + " "+re.getStaffid());
        } finally {
            session.close();
        }
        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProductDG("");
        model.addAttribute("listacc", list1);

        model.addAttribute("ktacc", 6);
        return "view_admin/index";
    }
//    @RequestMapping(params = "btnupdate")
//    public String update(ModelMap model, student student) {
//        model.addAttribute("message", "Bạn gọi update");
//        model.addAttribute("student", student);
//        return "success_1";
//    }
//
//    @RequestMapping(params = "btndetele")
//    public String delete(ModelMap model) {
//        model.addAttribute("message", "Bạn gọi delete");
//        return "student-mgr";
//    }
//
//    @RequestMapping(params = "btnreset")
//    public String reset(ModelMap model) {
//        model.addAttribute("message", "Bạn gọi reset");
//        model.addAttribute("name", "");
//        model.addAttribute("mark", "");
//        model.addAttribute("major", "");
//        model.addAttribute("kt", "true");
//        model.addAttribute("thongtin", a);
//        return "student-mgr";
//    }
//
//    @RequestMapping(params = "lnkdelete")
//    public String deletems(@RequestParam(value = "lnkdelete") String name, ModelMap model) {
//        model.addAttribute("message", a.size());
//        for (int i = 0; i < a.size(); i++) {
//            student st = (student) a.get(i);
//            if (name.equals(st.getName())) {
//                a.remove(i);
//            }
//        }
//
//        model.addAttribute("kt", "true");
//        model.addAttribute("thongtin", a);
//
//        return "student-mgr";
//    }
//
//    @RequestMapping(params = "lnkedit")
//    public String edit(@RequestParam(value = "lnkedit") String name,
//            ModelMap model,
//            @RequestParam(value ="diem",required = false) String diem,
//            @RequestParam(value ="Nganh",required = false) String nganh) {
//        model.addAttribute("message", a.size());
//        for (int i = 0; i < a.size(); i++) {
//            student st = (student) a.get(i);
//            if (name.equals(st.getName())) {
//                st.setMark(5);
//                st.setMajor(nganh);
//            }
//        }
//
//        model.addAttribute("kt", "true");
//        model.addAttribute("thongtin", a);
//
//        return "student-mgr";
//    }
}
