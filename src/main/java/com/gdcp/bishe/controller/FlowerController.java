package com.gdcp.bishe.controller;

import com.gdcp.bishe.bean.Flower;
import com.gdcp.bishe.service.FlowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class FlowerController {

    @Autowired
    private FlowerService flowerService;

    @Value("${localPath.upload.images}")
    private String localPath;

    //        增加花
    @RequestMapping(value = "/pages/admin/Flower/Product/add/addFlower")
    public String insertFlower(Model model, Flower flower) throws IOException {

        Flower flower1 = flowerService.checkExit(flower.getFlowerName());

        if (flower1 == null) {
            String sqlPath = null;
            String fileName = null;

            if (!flower.getFile().isEmpty()) {
                String uuid = UUID.randomUUID().toString().replaceAll("-", "");
                String contentType = flower.getFile().getContentType();
                String suffixName = contentType.substring(contentType.indexOf("/") + 1);

                fileName = uuid + "." + suffixName;
                System.out.println(fileName + "fileName");
                flower.getFile().transferTo(new File(localPath + fileName));
            }
            sqlPath = "images/" + fileName;
            System.out.println(sqlPath + "123123");
            System.out.println(fileName + "fileName");
            flower.setFlowerImg(sqlPath);
            System.out.println(flower.getFlowerImg());
            int rows = flowerService.insertFlower(flower);
            if (rows > 0) {
                System.out.println("OK");
                return "redirect:/pages/admin/Flower/Product/index/selectFlower";
//                    return "/admin/Flower/Product/index";
            } else {
                System.out.println("Fail");
                model.addAttribute("msg", "添加失败");
                return "/admin/Flower/Product/add";
            }
        } else {
            model.addAttribute("msg", "商品已存在");
            return "/admin/Flower/Product/add";
        }
    }

    //        删除花
    @RequestMapping(value = "/pages/admin/Flower/Product/index/deleteFlower")
    @ResponseBody
    public String deleteFlower(Integer flowerId) {
        int rows = flowerService.deleteFlower(flowerId);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    //            更新花
    @RequestMapping(value = "/pages/admin/Flower/Product/edit/updateFlower")
    @ResponseBody
    public String updateFlower(Flower flower) {
        int rows = flowerService.updateFlower(flower);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    //            花名查花
    @RequestMapping(value = "/pages/admin/Flower/Product/index/selectFlower")
    public String selectFlower(String flowerName, Model model) {
        List<Flower> flowerList = flowerService.getFlowerByName(flowerName);
        model.addAttribute("FLOWER_LIST", flowerList);
        return "admin/Flower/Product/index";
    }

    //        所有花
    @RequestMapping(value = "/pages/view/selectFlowerList")
    public String selectFlowerList(Model model) {
        List<Flower> flowerList = flowerService.selectFlowerList();
        model.addAttribute("FLOWER_LIST", flowerList);
        return "view/";
    }

    //        花类型查花
    @RequestMapping(value = "/pages/view/User/selectFlowerByType")
    public String selectFlowerByType(String flowerType, Model model) {
        System.out.println(flowerType);
        List<Flower> flowerList = flowerService.selectFlowerByType(flowerType);
        System.out.println(flowerList);
        model.addAttribute("flower_type_list", flowerList);
        return "/view/love_datails";
    }

    //        用户浏览页面
    @RequestMapping(value = "/pages/view/User/list")
    public String userSelectFlowerByType(Model model) {
        List<Flower> flowerList = flowerService.selectFlowerList();
        model.addAttribute("flower_list", flowerList);
        return "/view/User";
    }

    //        游客预览页面
    @RequestMapping(value = "/pages/index/list")
    public String allList(Model model) {
        List<Flower> flowerList = flowerService.selectFlowerList();
        model.addAttribute("flower_list", flowerList);
        return "index";
    }


    @RequestMapping(value = "/pages/admin/Flower/Product/Index/findFlowerById")
    public ModelAndView findFlowerById(String flowerId, ModelAndView mav) {
        Flower flower = flowerService.findFlowerById(flowerId);
        mav = new ModelAndView("admin/Flower/Product/edit");
        mav.addObject("flower", flower);
        return mav;
    }

    //        买花
    @RequestMapping(value = "/pages/view/User/buyFlowerById")
    public String butFlowerById(String flowerId, Model model) {
        Flower flower = flowerService.findFlowerById(flowerId);
        model.addAttribute("Flower", flower);
        return "/view/details";
    }

    @RequestMapping(value = "/pages/view/userSelectFlower")
    public String userSelectFlower(String flowerName, String firstMoney,
                                   String lastMoney, Model model) {
        List<Flower> flowerList = flowerService.allSelectFlower(flowerName,
                firstMoney, lastMoney);
        model.addAttribute("FLOWER_LIST", flowerList);
        model.addAttribute("FLOWER_COUNT", flowerList.size());
        return "view/selectFlower";
    }

    @RequestMapping(value = "/pages/view/shopCar/back", method = RequestMethod.GET)
    public String backDetails(String flowerName, Model model) {
        List<Flower> flowerList = flowerService.getFlowerByName(flowerName);
        model.addAttribute("FLOWER_LIST", flowerList);
        return "view/selectFlower";
    }
}
