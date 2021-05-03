package com.gdcp.bishe.service;

import com.gdcp.bishe.bean.Order;

import java.util.List;

public interface OrderService  {
    int insertOrder(Order order);

    int updateOrder(Order order);

    List<Order> selectOrderList(String orderUser);

    List<Order> orderFind(Integer userId);

    Order selectOrderByIUser(Integer orderId);

    List<Order> selectOrderByUser(Integer userId);

    Order selectOrderById(Integer orderId);
}
