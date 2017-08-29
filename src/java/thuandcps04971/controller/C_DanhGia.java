/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import entity.Record;
import entity.Staff;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import javax.transaction.Transactional;
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
import thuandcps04971.javabean.phongnhansu;
import thuandcps04971.javabean.user;
import thuandcps04971.model.modeacc;
import thuandcps04971.model.modelnv;
import thuandcps04971.model.modelpb;

/**
 *
 * @author Administrator
 */
@Transactional
@Controller
@RequestMapping("/record/")
public class C_DanhGia {

    Vector a = new Vector();

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "insert", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("record", new Record());
        model.addAttribute("ktacc", 3);
        return "view_admin/index";
    }

    @RequestMapping(value = "trove", method = RequestMethod.POST)
    public String ve1(ModelMap model) {
        model.addAttribute("record", new Record());
        model.addAttribute("ktacc", 3);
        return "view_admin/index";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("record") Record record) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            record.setDate(new Date());
            session.save(record);

            t.commit();
            String hql = "SELECT r.staff.id, " + " SUM(case when r.type=1 then 1 else 0 end), " + " SUM(case when r.type=0 then 1 else 0 end)" + " FROM Record r " + " GROUP BY r.staff.id";
            Query query = session.createQuery(hql);
            List<Object[]> list = query.list();
            model.addAttribute("arrays", list);
            model.addAttribute("message", "Thêm mới thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại !" + record.getId());
        } finally {
            session.close();
        }
       
        model.addAttribute("ktacc", 5);
        return "view_admin/index";
    }

    @ModelAttribute("staffs")
    public List<Staff> getStaffs() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        List<Staff> list = query.list();
        return list;
    }

    @RequestMapping("DGNNV")//Đánh giá nhiều nhân viên
    public String quanlypb(ModelMap model) {
        modelnv u_model1 = new modelnv();
        List<NhanVien> list1 = new ArrayList<>();
        list1 = modelnv.showProductDG("");
        model.addAttribute("listacc", list1);

        model.addAttribute("ktacc", 6);
        return "view_admin/index";
    }

   

    @RequestMapping("report")
    public String report(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT r.staff.id, " + " SUM(case when r.type=1 then 1 else 0 end) as Tru, " + " SUM(case when r.type=0 then 1 else 0 end) as Tong" + " FROM Record r " + " GROUP BY r.staff.id ORDER BY r.staff.id  ASC  ";
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        model.addAttribute("arrays", list);
        model.addAttribute("ktacc", 4);
        return "view_admin/index";
    }
}
