package com.gdcp.bishe.service.impl;

import com.gdcp.bishe.bean.User;
import com.gdcp.bishe.dao.UserDao;
import com.gdcp.bishe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("UserServiceImpl")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

//    登录
    @Override
    public User checkLogin(String userName, String userPassword) {
        User user = userDao.findUser(userName);
        if (user != null && user.getUserPassword().equals(userPassword)){
            return  user;
        }
        return null;
    }

    @Override
    public User checkExit(String userName) {

        User user = userDao.findUser(userName);

        if( user != null){
            return user;
        }
        return null;
    }
//    添加
    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int RinsertUser(User user) {
        return userDao.RinsertUser(user);
    }

    //    删除
    @Override
    public int deleteUser(Integer userId) {
        return userDao.deleteUser(userId);
    }


//    修改密码
    @Override
    public int revisePassword(User user) {
        return userDao.revisePassword(user);
    }

    @Override
    public User checkPhoneName(String userPhone,String userName) {
        User user = userDao.checkPhoneName(userPhone,userName);
        if(user != null){
            return user;
        }
        return null;
    }

    @Override
    public List<User> selectUserList() {
        return userDao.selectUserList();
    }

    @Override
    public List<User> getUserByName(String userName) {
        return userDao.getUserByName(userName);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public User findUserById(String userId) {
        return userDao.findUserById(userId);
    }

    @Override
    public int insertMoney(int userId, int userMoney) {
        return userDao.insertMoney(userId,userMoney);

    }

    @Override
    public int updateMoney(Integer userId,Double userMoney) {
        return userDao.updateMoney(userId,userMoney);
    }

}
