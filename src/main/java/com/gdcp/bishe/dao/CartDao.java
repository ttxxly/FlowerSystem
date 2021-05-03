package com.gdcp.bishe.dao;

import com.gdcp.bishe.bean.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {
    int insertCart(Cart cart);

    Cart findCartByFId(@Param("flowerId") int flowerId,@Param("userId") int userId);

    List<Cart> selectCartByUId(int userId);

    int deleteCartFlower(@Param("flowerId") int flowerId,@Param("userId") int userId);
}
