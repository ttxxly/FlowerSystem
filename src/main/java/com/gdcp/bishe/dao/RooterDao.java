package com.gdcp.bishe.dao;

import com.gdcp.bishe.bean.Rooter;
import org.apache.ibatis.annotations.Param;


public interface RooterDao {

    Rooter findRooter(String rooterName);
}
