package com.gdcp.bishe.dao;

import com.gdcp.bishe.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {

     User findUser(String userName);

//    增
     int insertUser(User user);

     int RinsertUser(User user);

//    删
     int deleteUser(Integer userId);

//    改密码
    int revisePassword(User user);

    User checkPhoneName(@Param("userPhone")String userPhone,String userName);

//    改信息
    int updateUser(User user);

//   查所有
    List<User> selectUserList();

//   根据userName查人
    List<User> getUserByName(String userName);

    User findUserById(String userId);

    int insertMoney(@Param("userId")Integer userId,@Param("userMoney")Integer userMoney);

    int updateMoney(@Param("userId")Integer userId,@Param("userMoney")Double userMoney);

}
