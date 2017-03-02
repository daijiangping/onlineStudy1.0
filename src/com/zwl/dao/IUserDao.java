package com.zwl.dao;

import com.zwl.entity.User;

/**
 * author zwl
 * create Date 2016/12/14
 */
public interface IUserDao{

    User ByUserName(String userName);//根据用户名查找用户信息
    User findByID(Integer id);//根据ID查找用户信息
    void update(User user);//修改
    void delete(User user);//删除
    void save(User user);//保存

    boolean checkUserNameIsExist(String userName);

    User findByUserNameAndPassword(String userName, String password);

    void updateRealName(Integer id, String realName);//修改用户真实名字

    void updatePwd(Integer id, String newPwd);//修改密码

    void updateHead(Integer id, String saveName);
}
