package com.zwl.service.impl;

import com.zwl.dao.IUserDao;
import com.zwl.entity.Role;
import com.zwl.entity.User;
import com.zwl.service.IUserService;
import com.zwl.util.MD5Utils;

import java.util.Date;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class UserService implements IUserService {
    private IUserDao userDao;

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public boolean register(User user) {
        user.setAddTime(new Date());
        user.setRole(new Role(1));//普通用户
        user.setRealName("还没有名字");
        String md5Pwd = MD5Utils.toMD5(user.getPassword());
        user.setPassword(md5Pwd);
        userDao.save(user);
        return false;
    }
    @Override
    public User login(User user) {
        String md5Pwd = MD5Utils.toMD5(user.getPassword());//使用md5加密
        return userDao.findByUserNameAndPassword(user.getUserName(),md5Pwd);
    }

    @Override
    public void updateRealName(Integer id, String realName) {
        userDao.updateRealName(id,realName);
    }

    @Override
    public void updatePwd(Integer id, String newPwd) {
        userDao.updatePwd( id,  newPwd);
    }

    @Override
    public void updateHead(Integer id, String saveName) {
        userDao.updateHead( id, saveName);
    }

    @Override
    public boolean update(User user) {
        userDao.update(user);
        return false;
    }

    @Override
    public boolean checkUserNameIsExist(String userName) {

        return userDao.checkUserNameIsExist(userName);
    }

}
