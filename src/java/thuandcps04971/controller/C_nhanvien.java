/*
 * To change this license header, choose License Headerequest in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thuandcps04971.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import thuandcps04971.javabean.NhanVien;
import thuandcps04971.javabean.phongnhansu;
import thuandcps04971.model.modelnv;
import thuandcps04971.model.modelpb;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/NhanVien")
public class C_nhanvien {

    @Autowired
	ServletContext context;
    
    @ModelAttribute("GioiTinh")
    public Map<String, String> getMajors1() {
        Map<String, String> GioiTinh = new HashMap<>();
        GioiTinh.put("1", "Nam");
        GioiTinh.put("0", "Nữ");
        return GioiTinh;
    }

    @ModelAttribute("phongban")
    public List<phongnhansu> getMajors2() {
        List<phongnhansu> phongban = new ArrayList<>();
        modelpb u_model = new modelpb();
        List<phongnhansu> ds = new ArrayList<phongnhansu>();
        ds = modelpb.showProduct("");
        for (phongnhansu cv : ds) {
            phongban.add(cv);
        }
        return phongban;
    }

    @ModelAttribute("majors")
    public List<phongnhansu> getMajors23() {
        List<phongnhansu> majors = new ArrayList<>();
        modelpb u_model = new modelpb();
        List<phongnhansu> ds = new ArrayList<phongnhansu>();
        ds = modelpb.showProduct("");
        for (phongnhansu cv : ds) {
            majors.add(cv);
        }
        return majors;
    }

    @RequestMapping(params = "Edit", method = RequestMethod.POST)
    public String edit(HttpServletRequest request, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("id2"));
        String name = request.getParameter("name");
        String gioitinh = request.getParameter("gioitinh");
        String ngaysinh = request.getParameter("sinhnhat");
        String anh = request.getParameter("anh");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String luong = request.getParameter("luong");
        String chuy = request.getParameter("chuy");
        String mapb = request.getParameter("mpb");
        NhanVien sv = new NhanVien(id, name, gioitinh, ngaysinh, anh, email, sdt, luong, chuy, mapb);
        model.addAttribute("danhsach", sv);

        List<NhanVien> list = new ArrayList<NhanVien>();
        list = modelnv.showProduct("");
        model.addAttribute("listacc1", list);
        model.addAttribute("img",anh );
        modelpb u_model1 = new modelpb();
        List<phongnhansu> list1 = new ArrayList<>();
        list1 = modelpb.showProduct("");
        model.addAttribute("listacc", list1);

        phongnhansu a1 = new phongnhansu();
        a1 = list1.get(0);
        model.addAttribute("nhanvien", a1);
        
        model.addAttribute("ktacc", 2);
        
        return "view_admin/index";
    }

    @RequestMapping(params = "Delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest request, ModelMap model) {
        int id = Integer.parseInt(request.getParameter("id2"));
        modelnv.delete(id);
        List<NhanVien> list = new ArrayList<NhanVien>();
        list = modelnv.showProduct("");
        model.addAttribute("listacc1", list);
        NhanVien a = new NhanVien();
        a = list.get(0);
        model.addAttribute("danhsach", a);
        model.addAttribute("ktacc", 2);

        modelpb u_model1 = new modelpb();
        List<phongnhansu> list1 = new ArrayList<>();
        list1 = modelpb.showProduct("");
        model.addAttribute("listacc", list1);

        phongnhansu a1 = new phongnhansu();
        a1 = list1.get(0);
        model.addAttribute("nhanvien", a1);

        model.addAttribute("ktacc", 2);

        return "view_admin/index";
    }

    @RequestMapping(params = "btnUpdate")
    public String update(@ModelAttribute("danhsach") NhanVien NhanVienupdate, ModelMap model,
             @RequestParam("image") MultipartFile image) {
         if(image.isEmpty()){
			model.addAttribute("message", "Vui lòng chọn file !");
		}
		else{
			try {
				String path = context.getRealPath("/resource/images/nhanvien/"+image.getOriginalFilename());
				image.transferTo(new File(path));
				model.addAttribute("img", image.getOriginalFilename());
			} 
			catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
        NhanVienupdate.setAnh(image.getOriginalFilename());
        modelnv.update(NhanVienupdate);
        List<NhanVien> list = new ArrayList<NhanVien>();
        list = modelnv.showProduct("");
        model.addAttribute("listacc1", list);
        NhanVien a = new NhanVien();
        a = list.get(0);
        model.addAttribute("danhsach", a);
        model.addAttribute("ktacc", 2);

        modelpb u_model1 = new modelpb();
        List<phongnhansu> list1 = new ArrayList<>();
        list1 = modelpb.showProduct("");
        model.addAttribute("listacc", list1);

        phongnhansu a1 = new phongnhansu();
        a1 = list1.get(0);
        model.addAttribute("nhanvien", a1);

        model.addAttribute("ktacc", 2);

        return "view_admin/index";
    }

    @RequestMapping(params = "btnInsert",method = RequestMethod.POST)
    public String insert(@ModelAttribute("danhsach") NhanVien us, ModelMap model,
            @RequestParam("image") MultipartFile image) {
        if(image.isEmpty()){
			model.addAttribute("message", "Vui lòng chọn file !");
		}
		else{
			try {
				String path = context.getRealPath("/resource/images/nhanvien/"+image.getOriginalFilename());
				image.transferTo(new File(path));
				model.addAttribute("img", image.getOriginalFilename());
			} 
			catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
        us.setAnh(image.getOriginalFilename());
        modelnv.insert(us);
        List<NhanVien> list = new ArrayList<NhanVien>();
        list = modelnv.showProduct("");
        model.addAttribute("listacc1", list);
        NhanVien a = new NhanVien();
        a = list.get(0);
        model.addAttribute("danhsach", a);

        modelpb u_model1 = new modelpb();
        List<phongnhansu> list1 = new ArrayList<>();
        list1 = modelpb.showProduct("");
        model.addAttribute("listacc", list1);

        phongnhansu a1 = new phongnhansu();
        a1 = list1.get(0);
        model.addAttribute("nhanvien", a1);

        model.addAttribute("ktacc", 2);
            model.addAttribute("ktms", us.getSinhnhat()+"123");
        return "view_admin/index";
    }
    
    @RequestMapping("upload")
	public String upload(ModelMap model, 
			@RequestParam("image") MultipartFile image) {
		if(image.isEmpty()){
			model.addAttribute("message", "Vui lòng chọn file !");
		}
		else{
			try {
				String path = context.getRealPath("/resource/images/nhanvien/"+image.getOriginalFilename());
				image.transferTo(new File(path));
				model.addAttribute("img", image.getOriginalFilename());
                                model.addAttribute("message", "Lưu File Thành Công !");
			} 
			catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
              
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
        model.addAttribute("ktacc", 2);
        return "view_admin/index";
		
	}
}
