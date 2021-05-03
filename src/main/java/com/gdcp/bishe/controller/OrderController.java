package com.gdcp.bishe.controller;

import com.gdcp.bishe.bean.Flower;
import com.gdcp.bishe.bean.Order;
import com.gdcp.bishe.bean.User;
import com.gdcp.bishe.service.CartService;
import com.gdcp.bishe.service.FlowerService;
import com.gdcp.bishe.service.OrderService;
import com.gdcp.bishe.service.UserService;
import com.google.gson.JsonObject;
import org.aspectj.weaver.ast.Or;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;
    @Autowired
    private FlowerService flowerService;
    @Autowired
    private CartService cartService;

    //    增加订单
    @RequestMapping(value = "/pages/view/shopCart/BuyFlower")
    @ResponseBody
    public String insertOrder(@RequestBody Order[] orders, HttpSession session) {

        User user = (User) session.getAttribute("USER_SESSION");
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //从前端或者自己模拟一个日期格式，转为String即可
        SimpleDateFormat format_id = new SimpleDateFormat("yyyyMMddHHmmss");

        String str = format.format(date);
        String str_id = format_id.format(date);

        System.out.println(str_id);

        double userMoney = user.getUserMoney();
        double totalMoney;
        int a = 0;
        List<Order> orders1 = new ArrayList<>();
                for (Order o : orders) {
                o.setUserId(user.getUserId());
                o.setOrderTime(str);
                totalMoney = o.getTotalMoney();
//                订单号
                o.setOrderN(str_id);

                System.out.println(o.getFlowerId());
                System.out.println(o.getFlowerName());
                System.out.println(o.getTotalMoney());
                System.out.println(o.getOrderAddress());
                System.out.println(o.getOrderUser());
                System.out.println(o.getOrderNumber());
                System.out.println(o.getOrderPrice());
                System.out.println(o.getUserId());
                System.out.println(o.getOrderTime());
                System.out.println(o.getOrderPhone());
                System.out.println(o.getOrderN());
                orders1.add(o);
//            用户金额 > 订单总金额

                if (userMoney > totalMoney) {
                    System.out.println("money");
                    int rows = orderService.insertOrder(o);
                    System.out.println(rows);
                    if (rows > 0) {
//                       更新用户金额
                        int rows_money = userService.updateMoney(user.getUserId(), o.getOrderPrice());
                        System.out.println(rows_money);
                        if (rows_money > 0) {
                            String flowerNumber = String.valueOf(o.getOrderNumber());
//                        更新库存
                            int rows_flowerNumber = flowerService.updateFlowerNumber
                                    (o.getFlowerName(), flowerNumber);
                            System.out.println("rows_flowerNumber" + rows_flowerNumber);
                            if (rows_flowerNumber > 0) {
//                            清理购物车
                                int rows_flower = cartService.deleteCartFlower(o.getFlowerId(), o.getUserId());
                                if (rows_flower > 0) {
                                    System.out.println("ok");
                                    a=1;
                                } else {
                                    System.out.println("no_Flower");
                                    a=2;
                                }
                            } else {
                                System.out.println("flowerNumber_Not_Enough");
                                a =3;
//                                return "flowerNumber_Not_Enough";
                            }
                        } else {
                            System.out.println("userMoney_Not_Enough");
                            a =4 ;
//                            return "userMoney_Not_Enough";
                        }
                    } else {
                        System.out.println("fail");
                        a = 5;
//                        return "FAIL";
                    }
                } else {
                    System.out.println("money");
                    a = 6;
//                    return "money";
                }
            }
        if (a == 1){
            System.out.println(a+" ==? 1");
                return "OK";
        }if (a == 2){
            System.out.println(a+" ==? 2");
                return "no_Flower";
        }if (a == 3){
            System.out.println(a+" ==? 3");
                return "flowerNumber_Not_Enough";
        }if (a == 4){
            System.out.println(a+" ==? 4");
                return "userMoney_Not_Enough";
        }if (a == 5){
            System.out.println(a+" ==? 5");
                return "FAIL";
        }if (a == 6){
            System.out.println(a+" ==? 6");
                return "money";
        }else{
            System.out.println("日你妈");
                return "购买数量错误";
        }
    }

    @RequestMapping(value = "/pages/admin/Flower/Order/Index/selectOrderById")
    public ModelAndView selectOrderById(Integer orderId,ModelAndView mav){
        Order order = orderService.selectOrderById(orderId);
        mav = new ModelAndView("admin/Flower/Order/edit");
        mav.addObject("order",order);
        return mav;
    }

    @RequestMapping(value = "/pages/view/order/find")
    public String orderFind(HttpSession session,Model model){
        User user = (User) session.getAttribute("USER_SESSION");
        List<Order> orderList = orderService.orderFind(user.getUserId());
        model.addAttribute("ORDER_LIST",orderList);
        return "/view/order";
    }

//    改
    @RequestMapping(value = "/pages/admin/Flower/Order/edit/updateOrder")
    @ResponseBody
    public String updateOrder(Order order){
        int rows = orderService.updateOrder(order);
        if (rows >0){
            System.out.println("ok12");
            return "OK";
        }else{
            System.out.println("fail");
            return "FAIL";
        }
    }

//    列表
    @RequestMapping(value = "/pages/admin/Flower/Order/index/selectOrderList")
    public String selectOrderList(String orderUser, Model model){
        List<Order> orders = orderService.selectOrderList(orderUser);
        model.addAttribute("ORDER_LIST",orders);
        return "admin/Flower/Order/index";
    }


}
