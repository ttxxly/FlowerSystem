package com.gdcp.bishe.service.impl;

import com.gdcp.bishe.bean.Flower;
import com.gdcp.bishe.dao.FlowerDao;
import com.gdcp.bishe.service.FlowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FlowerServiceImpl implements FlowerService {

    @Autowired
    private FlowerDao flowerDao;

//    增加
    @Override
    public int insertFlower(Flower flower) {
        return flowerDao.insertFlower(flower);
    }

    @Override
    public List<Flower> getFlowerByName(String flowerName) {
        return flowerDao.getFlowerByName(flowerName);
    }

    @Override
    public List<Flower> allSelectFlower(String flowerName, String firstMoney, String lastMoney) {
        if (org.springframework.util.StringUtils.isEmpty(firstMoney)){
            firstMoney = "0";
        }
        if (org.springframework.util.StringUtils.isEmpty(lastMoney)){
            lastMoney = "99999999";
        }
        return flowerDao.allSelectFlower(flowerName,firstMoney,lastMoney);
    }

    @Override
    public List<Flower> cartSelectFlower(int flowerId) {
        return flowerDao.cartSelectFlower(flowerId);
    }

    @Override
    public List<Flower> selectFlowerList() {
        return flowerDao.selectFlowerList();
    }

    @Override
    public List<Flower> selectFlowerByType(String flowerType) {
        return flowerDao.selectFlowerByType(flowerType);
    }


    //    修改
    @Override
    public int updateFlower(Flower flower) {
        return flowerDao.updateFlower(flower);
    }

//    删除
    @Override
    public int deleteFlower(Integer flowerId) {
        return flowerDao.deleteById(flowerId);
    }

//    是否存在
    @Override
    public Flower checkExit(String flowerName) {
        Flower flower = flowerDao.findFlower(flowerName);
        if (flower != null){
            return flower;
        }
        return null;
    }

    @Override
    public Flower find(int flowerId) {
        return flowerDao.find(flowerId);
    }


    @Override
    public Flower findFlowerById(String flowerId) {
        return flowerDao.findFlowerById(flowerId);
    }

    @Override
    public int updateFlowerNumber(String flowerName,String flowerNumber) {
        return flowerDao.updateFlowerNumber(flowerName,flowerNumber);
    }


}
