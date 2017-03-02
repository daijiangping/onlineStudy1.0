package com.zwl.dao.impl;

import com.zwl.dao.IProblemDao;
import com.zwl.dao.IProblemSortDao;
import com.zwl.dao.IUserDao;
import com.zwl.entity.Problem;
import com.zwl.entity.ProblemSort;
import com.zwl.entity.User;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class ProblemSortDao implements IProblemSortDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(ProblemSort problemSort) {

    }

    @Override
    public List<ProblemSort> findAll() {
        return sessionFactory.getCurrentSession().createQuery("from ProblemSort")
               .list();
    }

    @Override
    public List<ProblemSort> PageFindSort(int start, int end) {
        return sessionFactory.getCurrentSession().createQuery("from ProblemSort")
                .setFirstResult(start).setMaxResults(end)
                .list();
    }
}
