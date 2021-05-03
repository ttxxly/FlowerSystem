package com.gdcp.bishe.service.impl;

import com.gdcp.bishe.bean.Cart;
import com.gdcp.bishe.dao.CartDao;
import com.gdcp.bishe.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public int insertCart(Cart cart) {
        return cartDao.insertCart(cart);
    }

    @Override
    public List<Cart> selectCartByUId(int userId) {
        return cartDao.selectCartByUId(userId);
    }

    @Override
    public int deleteCartFlower(int flowerId,int userId) {
        return cartDao.deleteCartFlower(flowerId,userId);
    }

    @Override
    public Cart findCartByFId(int flowerId,int userId) {
        return cartDao.findCartByFId(flowerId,userId);
    }
}

