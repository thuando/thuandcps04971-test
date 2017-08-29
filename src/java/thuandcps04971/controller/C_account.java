/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import thuandcps04971.javabean.user;
import thuandcps04971.model.modeacc;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/Account")
public class C_account {

    @Autowired
    SessionFactory factory;
    
    @RequestMapping("Login")
    public String v_login() {
        return "_Login";
    }

    @RequestMapping("submit")
    public String Login(ModelMap model,
            @RequestParam("username") String user, HttpSession session,
            @RequestParam("password") String pass,
            @RequestParam(value = "remember", defaultValue = "false", required = false) Boolean rm,
            HttpServletResponse response) {
        modeacc u_model = new modeacc();
        String kt = u_model.KT_lg(user, pass);
        if (kt.equals("")) {
            model.addAttribute("message", "Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng");
            return "_Login";
        } else {

            model.addAttribute("user", kt);
         
          
             model.addAttribute("ktacc1", 1);
             session.setAttribute("userkt", user);
            return "view_admin/index";
        }
          
    }

    

    @RequestMapping("quanlyacc")
    public String quanly(ModelMap model) {
        modeacc u_model = new modeacc();
        List<user> list = new ArrayList<>();
        list = u_model.showProduct("");
        model.addAttribute("listacc", list);

        user a = new user();
        a = list.get(0);
        model.addAttribute("dautien", a);
        model.addAttribute("ktacc", 1);
        return "view_admin/index";
    }

    @RequestMapping(params = "Edit", method = RequestMethod.POST)
    public String edit(HttpServletRequest request, ModelMap model) {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String full = request.getParameter("full");
        user sv = new user(name, pass, full);
        model.addAttribute("dautien", sv);

        List<user> list = new ArrayList<user>();
        list = modeacc.showProduct("");
        model.addAttribute("listacc", list);
        model.addAttribute("ktacc", 1);
        return "view_admin/index";
    }

    @RequestMapping(params = "Delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest request, ModelMap model,
            @ModelAttribute("user") user userdetele) {
        String name = request.getParameter("name");
        modeacc.delete(name);
        List<user> list = new ArrayList<user>();
        list = modeacc.showProduct("");
        model.addAttribute("listacc", list);
        user a = new user();
        a = list.get(0);
        model.addAttribute("dautien", a);
        model.addAttribute("ktacc", 1);
        return "view_admin/index";
    }

    @RequestMapping(params = "btnUpdate")
    public String update(@ModelAttribute("dautien") user userupdate, ModelMap model) {
        modeacc.update(userupdate);
        List<user> list = new ArrayList<user>();
        list = modeacc.showProduct("");
        model.addAttribute("listacc", list);
        user a = new user();
        a = list.get(0);
        model.addAttribute("dautien", a);
        model.addAttribute("ktacc", 1);
        return "view_admin/index";
    }

    @RequestMapping(params = "btnInsert")
    public String insert(@ModelAttribute("dautien") user us, ModelMap model) {
        modeacc.insert(us);
        List<user> list = new ArrayList<user>();
        list = modeacc.showProduct("");
        model.addAttribute("listacc", list);
        user a = new user();
        a = list.get(0);
        model.addAttribute("dautien", a);
        model.addAttribute("ktacc", 1);
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
