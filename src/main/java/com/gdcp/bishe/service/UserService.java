package com.gdcp.bishe.service;

import com.gdcp.bishe.bean.User;

import java.util.List;

public interface UserService{

//     登录
     User checkLogin(String userName,String userPassword);

     User checkExit(String userName);

//     添加
     int insertUser(User user);

     int RinsertUser(User user);

//     删除
     int deleteUser(Integer userId);
//     修改密码
     int revisePassword(User user);

     User checkPhoneName(String userPhone,String userName);

//     查询
     List<User> selectUserList();


     //   根据userName查人
     List<User> getUserByName(String userName);

//     改
     int updateUser(User user);

     User findUserById(String userId);

     int insertMoney(int userId,int userMoney);

     int updateMoney(Integer userId,Double userMoney);


}
