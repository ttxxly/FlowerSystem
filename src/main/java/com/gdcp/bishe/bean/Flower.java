package com.gdcp.bishe.bean;

import org.springframework.web.multipart.MultipartFile;

public class Flower {
    private int flowerId;

    private String flowerName;

    private int flowerNumber;

    private Double flowerPrice;

    private String flowerImg;

    private String flowerType;

    private MultipartFile file;

    public int getFlowerId() {
        return flowerId;
    }

    public void setFlowerId(int flowerId) {
        this.flowerId = flowerId;
    }

    public String getFlowerName() {
        return flowerName;
    }

    public void setFlowerName(String flowerName) {
        this.flowerName = flowerName;
    }

    public int getFlowerNumber() {
        return flowerNumber;
    }

    public void setFlowerNumber(int flowerNumber) {
        this.flowerNumber = flowerNumber;
    }

    public Double getFlowerPrice() {
        return flowerPrice;
    }

    public void setFlowerPrice(Double flowerPrice) {
        this.flowerPrice = flowerPrice;
    }

    public String getFlowerImg() {
        return flowerImg;
    }

    public void setFlowerImg(String flowerImg) {
        this.flowerImg = flowerImg;
    }

    public String getFlowerType() {
        return flowerType;
    }

    public void setFlowerType(String flowerType) {
        this.flowerType = flowerType;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}