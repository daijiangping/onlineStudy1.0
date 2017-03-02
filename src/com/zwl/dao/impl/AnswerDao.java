package com.zwl.dao.impl;

import com.zwl.dao.IAnswerDao;
import com.zwl.entity.Answer;
import org.hibernate.SessionFactory;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class AnswerDao implements IAnswerDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Answer answer) {

    }
}
