package com.gdcp.bishe.service;


import com.gdcp.bishe.bean.Rooter;
import com.gdcp.bishe.dao.RooterDao;

public interface RooterService {
    Rooter checkRooter(String rooterName, String rooterPassword);
}
