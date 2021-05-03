package com.gdcp.bishe.controller;

import com.gdcp.bishe.bean.Rooter;
import com.gdcp.bishe.service.RooterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class RooterController {

    @Autowired
    private RooterService rooterService;

//    管理员登录
    @RequestMapping(value = "/login/Rlogin",method = RequestMethod.POST)
    public String Rlogin(Rooter rooter, Model model, HttpSession session){
        rooter = rooterService.checkRooter(rooter.getRooterName(),rooter.getRooterPassword());
        System.out.println(rooter);
        if(rooter != null){
            session.setAttribute("ROOTER_SESSION",rooter);
            return "redirect:../pages/admin/index.jsp";
        }
        model.addAttribute("msg","登录失败，请重试");
        return "login/Rlogin";
    }

    // 退出登录
    @RequestMapping( value = "/Rlogout")
    public String Rlogout(HttpSession session){
        // clean
        session.invalidate();
        // 重定向
        return "redirect:Rlogin";
    }

    //管理登录页面跳转
    @RequestMapping(value = "/Rlogin", method = RequestMethod.GET)
    public String toRLogin(){
        return "Rlogin";
    }
}
