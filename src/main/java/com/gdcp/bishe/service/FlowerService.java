package com.gdcp.bishe.service;

import com.gdcp.bishe.bean.Flower;

import java.util.List;
import java.util.Map;


public interface FlowerService {

    int insertFlower(Flower flower);

    List<Flower> getFlowerByName(String flowerName);

    List<Flower> allSelectFlower(String flowerName,
                                 String firstMoney,String lastMoney);

    List<Flower> cartSelectFlower(int flowerId);

    List<Flower> selectFlowerList();

    List<Flower> selectFlowerByType(String flowerType);

    int updateFlower(Flower flower);

    int deleteFlower(Integer flowerId);

    Flower checkExit(String flowerName);

    Flower find(int flowerId);

    Flower findFlowerById(String flowerId);

    int updateFlowerNumber(String flowerName,String flowerNumber);


}
