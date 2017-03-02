package com.zwl.dao.impl;

import com.zwl.dao.IAuthorityDao;
import com.zwl.dao.IRoleDao;
import com.zwl.entity.Authority;
import com.zwl.entity.Role;
import org.hibernate.SessionFactory;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class AuthorityDao implements IAuthorityDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Authority authority) {

    }
}
