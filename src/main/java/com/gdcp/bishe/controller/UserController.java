package com.gdcp.bishe.controller;

import com.gdcp.bishe.bean.User;
import com.gdcp.bishe.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 登录
    @RequestMapping(value = "/login/login", method = RequestMethod.POST)
    public String login(User user,Model model,HttpSession session){
        System.out.println(user.toString());
        user = userService.checkLogin(user.getUserName(),user.getUserPassword());
        System.out.println(user);
        if(user != null){
            session.setAttribute("USER_SESSION",user);
            return "redirect:/pages/view/User/list";
        }
        model.addAttribute("msg","账号或者密码错误，请重新输入");
        return "login/login";
    }



    // 退出登录
    @RequestMapping( value = "/login/logout")
    public String logout(HttpSession session){
        session.removeAttribute("USER_SESSION");
        // clean
        session.invalidate();
        // 重定向
        return "redirect:../pages/login/login.jsp";
    }

    //用户登录页面跳转
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }


//  注册
    @RequestMapping(value = "/pages/view/register/register",
            method = RequestMethod.POST)
    @ResponseBody
    public String insertUser(User user){
        User user1 = userService.checkExit(user.getUserName());
        if (user1 == null){
            int rows = userService.insertUser(user);
            if(rows >0 ){
                System.out.println("OK");
                return "OK";
            }else{
                System.out.println("F");
                return "FAIL";
            }
        }else{
          return "IN";
            }
    }
//  管理员注册用户
    @RequestMapping(value = "/pages/admin/System/User/add/addUser",
            method = RequestMethod.POST)
    @ResponseBody
    public String RinsertUser(User user){
        User user1 = userService.checkExit(user.getUserName());
        if (user1 == null){
            int rows = userService.RinsertUser(user);
            if(rows >0 ){
                System.out.println("OK");
                return "OK";
            }else{
                System.out.println("FAIL");
                return "FAIL";
            }
        }else{
            return "IN";
        }
    }


    @RequestMapping(value = "/pages/view/register/register", method = RequestMethod.GET)
    public String toInsert(){
        return "view/register";
    }

//  删除
    @RequestMapping(value = "/pages/admin/System/User/index/deleteUser")
    @ResponseBody
    public String deleteUser(int userId){
        System.out.println(userId);
        int rows = userService.deleteUser(userId);
        if (rows >0){
            return "OK";
        }else{
            return "FALL";
        }
    }

//    改密码
    @RequestMapping(value = "/revisePassword",method = RequestMethod.POST)
    @ResponseBody
    public String revisePassword(User user){
        User user1 = userService.checkExit(user.getUserName());
            if (user1 != null){
                User user2 = userService.checkPhoneName(user.getUserPhone(),user.getUserName());
                    if(user2 != null){
                        int rows = userService.revisePassword(user);
                            if(rows>0){
                                return "OK";
                            }else{
                                return "FAIL";
                            }
                    }else {
                        return "FAIL";
                    }
            }
        return "NOT";
    }


//    改
    @RequestMapping(value = "/pages/admin/System/User/edit/updateUser")
    @ResponseBody
    public String updateUser(User user){
        int rows = userService.updateUser(user);
        System.out.println(rows);
        if (rows >0){
            return "OK";
        }else{
            return "FALL";
        }
    }


//    姓名查询
    @RequestMapping(value = "/pages/admin/System/User/index/getUserByName")
    public String getUserByName(String userName,Model model ){
        System.out.println(userName);
        List<User> users = userService.getUserByName(userName);
        System.out.println(users);
        model.addAttribute("USERS",users);
        return "admin/System/User/index";
    }

//    查询所有
    @RequestMapping(value = "/pages/test/user/userList")
    public String  selectUserList(Model model){
        List<User> users = userService.selectUserList();
        model.addAttribute("USER_LIST",users);
        return "/admin/test/user";
    }

    @RequestMapping(value = "/pages/admin/System/User/Index/findUserById")
    public ModelAndView findUserById(String userId, ModelAndView mav){
        User user = userService.findUserById(userId);
        mav =  new ModelAndView("admin/System/User/edit");
        mav.addObject("user",user);
        return mav;
    }

    @RequestMapping(value = "/pages/view/money/in")
    @ResponseBody
    public String insertMoney(@Param("userMoney")int userMoney, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        int rows = userService.insertMoney(user.getUserId(),userMoney);
        if (rows >0){
            return "OK";
        }else{
            return "FALL";
        }
    }
}
