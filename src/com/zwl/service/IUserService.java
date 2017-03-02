package com.zwl.service;

import com.zwl.entity.User;

/**
 * author zwl
 * create Date 2016/12/14
 */
public interface IUserService {
    /**
     * 注册
     * @param user
     * @return
     */
    boolean register(User user);

    /**
     * 修改
     * @param user
     * @return
     */
    boolean update(User user);

    /**
     * 检查用户名是否存在
     * @param userName
     * @return
     */
    boolean checkUserNameIsExist(String userName);

    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 修改用户realname
     * @param id
     * @param realName
     */
    void updateRealName(Integer id, String realName);

    /**
     * 修改密码
     * @param id
     * @param newPwd
     */
    void updatePwd(Integer id, String newPwd);

    /**
     * 用户设置头像
     * @param id
     * @param saveName
     */
    void updateHead(Integer id, String saveName);
}
