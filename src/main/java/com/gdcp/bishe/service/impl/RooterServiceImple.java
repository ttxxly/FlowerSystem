package com.gdcp.bishe.service.impl;

import com.gdcp.bishe.bean.Rooter;
import com.gdcp.bishe.dao.RooterDao;
import com.gdcp.bishe.service.RooterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RooterServiceImple implements RooterService {

    @Autowired
    private RooterDao rooterDao;

    @Override
    public Rooter checkRooter(String rooterName, String rooterPassword) {
        Rooter rooter = rooterDao.findRooter(rooterName);
        if (rooter != null && rooter.getRooterPassword().equals(rooterPassword)){
            return rooter;
        }
        return null;
    }
}
