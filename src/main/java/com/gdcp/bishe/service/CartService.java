package com.gdcp.bishe.service;

import com.gdcp.bishe.bean.Cart;

import java.util.List;

public interface CartService {
    int insertCart(Cart cart);

    List<Cart> selectCartByUId(int userId);

    int deleteCartFlower(int flowerId,int userId);

    Cart findCartByFId(int flowerId ,int userId);
}
