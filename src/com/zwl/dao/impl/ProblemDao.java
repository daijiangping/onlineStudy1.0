package com.zwl.dao.impl;

import com.zwl.dao.IAnswerDao;
import com.zwl.dao.IProblemDao;
import com.zwl.entity.Answer;
import com.zwl.entity.Problem;
import com.zwl.entity.ProblemSort;
import com.zwl.util.PageModel;
import org.hibernate.SessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class ProblemDao implements IProblemDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Problem problem) {
        sessionFactory.getCurrentSession().save(problem);
    }

    @Override
    public Map<String, Object> initAllHot(int pageNo, int rows, String select) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = "";
        long count = 0;
        hql = "select count(*) from Problem";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem order by answerNumber desc")
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);
        map.put("pageNo", pageNo);
        map.put("total", count);
        map.put("totalPage", pm.getTotalPages());
        return map;
    }

    @Override
    public List<Problem> findPageTenRows(int start, int end, int sortId) {
        return sessionFactory.getCurrentSession().createQuery("from Problem p where p.problemSort.id=? order by p.answerNumber desc")
                .setParameter(0, sortId).setFirstResult(start).setMaxResults(end).list();
    }

    @Override
    public Map<String, Object> pageFindAllProblemBySortId(int sortId, int pageNo, int rows, int state) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem p where p.state=? and p.problemSort.id=?";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(0, state)
                .setParameter(1, sortId)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p where p.state=? and p.problemSort.id=? order by p.answerNumber desc")
                .setParameter(0, state)
                .setParameter(1, sortId)
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public Problem findById(Integer id) {
        return (Problem) sessionFactory.getCurrentSession().get(Problem.class,id);
    }

    @Override
    public List<Answer> findAllAnswerByProblemId(Integer id) {
        return sessionFactory.getCurrentSession().createQuery("from Answer p where p.problem.id=? order by id desc")
                .setParameter(0,id).list();
    }

    @Override
    public void addAnswer(Answer answer) {
        sessionFactory.getCurrentSession().save(answer);
    }

    @Override
    public void updateProblemAnswerNumber(Integer id) {
        sessionFactory.getCurrentSession().createQuery("update Problem p set p.answerNumber=answerNumber+1 where p.id=?")
                .setParameter(0,id).executeUpdate();
    }

    @Override
    public void updateSupport(Integer id,int number) {
        sessionFactory.getCurrentSession().createQuery("update Answer a set a.support=? where a.id=?")
                .setParameter(0,number).setParameter(1,id).executeUpdate();
    }

    @Override
    public void updateOppose(Integer id, int opp) {

    }

    @Override
    public Map<String, Object> allHotProblemPage(int pageNo, int rows, int state) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem p where p.state=?";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(0, state)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p where p.state=? order by p.answerNumber desc")
                .setParameter(0, state)
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public Map<String, Object> findNewProblemPage(int pageNo, int rows, int state) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem p where p.state=?";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(0, state)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p where p.state=? order by p.id desc")
                .setParameter(0, state)
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public List<Problem> serach(String keyword, int state) {
        /*return sessionFactory.getCurrentSession().createQuery("from Problem p where p.state=? and (p.title like '%"+keyword+"%' or p.content like '%"+keyword+"%')")
                .setParameter(0,state)
                .list();*/
        return sessionFactory.getCurrentSession().createQuery("from Problem p where p.state=? and p.title like '%"+keyword+"%'")
                .setParameter(0,state)
                .list();
    }

    @Override
    public Map<String, Object> findMyProblem(Integer id, int state, int pageNo, int rows) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem p where p.state=? and p.user.id=?";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(0, state)
                .setParameter(1,id)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p where p.state=? and p.user.id=? order by p.id desc")
                .setParameter(0, state)
                .setParameter(1,id)
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public void deleteMyProblem(Integer id, int state) {
        sessionFactory.getCurrentSession().createQuery("update Problem p set p.state=? where p.id=?")
                .setParameter(0,state).setParameter(1,id).executeUpdate();
    }

    @Override
    public Map<String, Object> findAlreadySolve(Integer id, int state, int pageNo, int rows) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem p where p.state=? and p.user.id=?";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(0, state)
                .setParameter(1,id)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p where p.state=? and p.user.id=? and p.answerNumber>0 order by p.answerNumber desc")
                .setParameter(0, state)
                .setParameter(1,id)
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public Map<String, Object> findUserAllProblem(int pageNo, int rows) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Problem> pm = new PageModel<Problem>();
        String hql = null;
        long count = 0;
        hql = "select count(*) from Problem";
        count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
                .uniqueResult();
        pm.setTotalRecords(count);
        pm.setPageNo(pageNo);
        pm.setPageSize(rows);
        List<Problem> list = sessionFactory.getCurrentSession()
                .createQuery("from Problem p order by p.id desc")
                .setFirstResult((int) pm.beginLimit())
                .setMaxResults((int) pm.getPageSize()).list();
        map.put("dataList", list);//数据
        map.put("pageNo", pageNo);//当前页码
        map.put("total", count);//总记录数
        map.put("totalPage", pm.getTotalPages());//总页数
        return map;
    }

    @Override
    public void delete(Integer id) {
        sessionFactory.getCurrentSession().createQuery("delete from Problem p where p.id=? ")
                .setParameter(0,id).executeUpdate();
    }

}
