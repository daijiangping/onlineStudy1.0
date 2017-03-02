package com.zwl.dao.impl;

import com.zwl.dao.IUserDao;
import com.zwl.entity.User;
import org.hibernate.SessionFactory;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class UserDao implements IUserDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User ByUserName(String userName) {
        return null;
    }

    @Override
    public User findByID(Integer id) {
        return null;
    }

    @Override
    public void update(User user) {

    }

    @Override
    public void delete(User user) {

    }

    @Override
    public void save(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public boolean checkUserNameIsExist(String userName) {
        boolean flag = false;
        long count = (long) sessionFactory.getCurrentSession().createQuery("select count(*) from User u where u.userName=?").setParameter(0,userName).uniqueResult();
        if (count>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public User findByUserNameAndPassword(String userName, String password) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.userName=? and u.password=?")
                .setParameter(0,userName)
                .setParameter(1,password)
                .uniqueResult();
    }

    @Override
    public void updateRealName(Integer id, String realName) {
        sessionFactory.getCurrentSession().createQuery("update User u set u.realName=? where u.id=?")
                .setParameter(0,realName).setParameter(1,id).executeUpdate();
    }

    @Override
    public void updatePwd(Integer id, String newPwd) {
        sessionFactory.getCurrentSession().createQuery("update User u set u.password=? where u.id=?")
                .setParameter(0,newPwd).setParameter(1,id).executeUpdate();
    }

    @Override
    public void updateHead(Integer id, String saveName) {
    sessionFactory.getCurrentSession().createQuery("update User u set u.headImg=? where u.id=?")
            .setParameter(0,saveName)
            .setParameter(1,id)
            .executeUpdate();
    }
}
