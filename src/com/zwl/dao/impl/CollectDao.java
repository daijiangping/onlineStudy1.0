package com.zwl.dao.impl;

import com.zwl.dao.ICollectDao;
import com.zwl.dao.IUserDao;
import com.zwl.entity.Collect;
import com.zwl.entity.User;
import org.hibernate.SessionFactory;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class CollectDao implements ICollectDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Collect collect) {

    }
}
