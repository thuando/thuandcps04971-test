/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import java.util.List;
import java.util.Vector;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrator
 */
@Transactional
@Controller
@RequestMapping("/TC/")
public class TC_index {

    Vector a = new Vector();
 
    @Autowired
    SessionFactory factory;
     @RequestMapping("report")
    public String report(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT r.staff.id,r.staff.name, r.staff.depart.name," 
                + " SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) as TTT "
                + " FROM Record r " +
                " GROUP BY r.staff.id,r.staff.name,r.staff.depart.name ORDER BY TTT DESC ";
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        model.addAttribute("arrays", list);
        model.addAttribute("ktacc", 7);
        return "TrangChu/Top10";
    }
    
    
    
  @RequestMapping("vitri")
   public String vitri(ModelMap model) {
       return "TrangChu/ViTri";
   }
}
