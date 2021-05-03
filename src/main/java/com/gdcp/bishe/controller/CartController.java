package com.gdcp.bishe.controller;

import com.gdcp.bishe.bean.Cart;
import com.gdcp.bishe.bean.Flower;
import com.gdcp.bishe.bean.User;
import com.gdcp.bishe.service.CartService;
import com.gdcp.bishe.service.FlowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private FlowerService flowerService;

    @RequestMapping(value = "/pages/view/details/buyFlower")
    @ResponseBody
    public String insertCart(Cart cart, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        if (user != null){
            cart.setUserId(user.getUserId());
            Cart cart1 = cartService.findCartByFId(cart.getFlowerId(),cart.getUserId());
                if (cart1 == null){
                    int rows = cartService.insertCart(cart);
                    if (rows>0){
                        return "OK";
                    }else{
                        return "FAIL";
                    }
                }else{
                    return "IN";
                }
        }
        return "FAIL";
    }

    @RequestMapping(value = "/pages/view/shopCart/list")
    public String selectCartByUId(HttpSession session,Model model){
        User user = (User) session.getAttribute("USER_SESSION");
        List<Cart> cartList = cartService.selectCartByUId(user.getUserId());
        model.addAttribute("cartList",cartList);
        List<Flower> flowerList = new ArrayList<>();
        for (Cart cart1:cartList) {
            flowerList.add(cart1.getFlowerList().get(0));
        }

        model.addAttribute("flowerList",flowerList);
        return "view/shopCar";
    }

    @RequestMapping(value = "/pages/view/shopCart/delete")
    @ResponseBody
    public String deleteCartFlower(HttpSession session,Integer flowerId){
        User user = (User) session.getAttribute("USER_SESSION");
        int rows = cartService.deleteCartFlower(flowerId,user.getUserId());
            if (rows>0){
                return "OK";
            }else {
                return "FAIL";
            }
    }
}
