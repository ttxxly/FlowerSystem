package com.gdcp.bishe.dao;

import com.gdcp.bishe.bean.Order;

import java.util.List;

public interface OrderDao {

    int insertOrder(Order order);

    int updateOrder(Order order);

    List<Order> selectOrderList(String orderUser);

    List<Order> orderFind(Integer userId);

    Order selectOrderById(Integer orderId);

    List<Order> selectOrderByUser(Integer userId);
}
