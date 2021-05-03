package com.gdcp.bishe.dao;

import com.gdcp.bishe.bean.Flower;
import org.apache.ibatis.annotations.Param;


import java.util.List;
import java.util.Map;

public interface FlowerDao {
    //查询所有花
     List<Flower> selectFlowerList();

    // 根据花名查询花
     List<Flower> getFlowerByName(String flowerName);

     List<Flower> cartSelectFlower(int flowerId);

     List<Flower> allSelectFlower(@Param("flowerName") String flowerName,
                                  @Param("firstMoney") String firstMoney,
                                  @Param("lastMoney") String lastMoney);

    // 删除花
     int deleteById(Integer flowerId);

    // 增加花
     int insertFlower(Flower flower);

    // 修改花
     int updateFlower(Flower flower);

//     修改库存
    int updateFlowerNumber(@Param("flowerName") String flowerName,
                           @Param("flowerNumber") String flowerNumber);


    Flower findFlower(String flowerName);

//    花类型查花
    List<Flower> selectFlowerByType(String flowerType);


    Flower find(Integer flowerId);

    Flower findFlowerById(String flowerId);

    List<Flower> findAll();

}
