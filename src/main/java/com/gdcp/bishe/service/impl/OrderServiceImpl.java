package com.gdcp.bishe.service.impl;

import com.gdcp.bishe.bean.Order;
import com.gdcp.bishe.dao.OrderDao;
import com.gdcp.bishe.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public int insertOrder(Order order) {

        return orderDao.insertOrder(order);
    }

    @Override
    public int updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    @Override
    public List<Order> selectOrderList(String orderUser) {
        return orderDao.selectOrderList(orderUser);
    }

    @Override
    public List<Order> orderFind(Integer userId) {
        return orderDao.orderFind(userId);
    }

    @Override
    public Order selectOrderByIUser(Integer orderId) {
        return null;
    }

    @Override
    public List<Order> selectOrderByUser(Integer userId) {
        return orderDao.selectOrderByUser(userId);
    }

    @Override
    public Order selectOrderById(Integer orderId) {
        return orderDao.selectOrderById(orderId);
    }

}
