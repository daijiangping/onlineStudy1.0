package com.zwl.service.impl;

import com.zwl.dao.IProblemDao;
import com.zwl.dao.IProblemSortDao;
import com.zwl.dao.IUserDao;
import com.zwl.entity.Answer;
import com.zwl.entity.Problem;
import com.zwl.entity.ProblemSort;
import com.zwl.entity.User;
import com.zwl.service.IProblemService;
import com.zwl.service.IUserService;

import java.util.List;
import java.util.Map;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class ProblemService implements IProblemService {
    private IProblemDao problemDao;
    private IProblemSortDao problemSortDao;

    public void setProblemSortDao(IProblemSortDao problemSortDao) {
        this.problemSortDao = problemSortDao;
    }

    public void setProblemDao(IProblemDao problemDao) {
        this.problemDao = problemDao;
    }

    @Override
    public void save(Problem problem) {
        problemDao.save(problem);
    }

    @Override
    public List<ProblemSort> findAllProblemSort() {
        return problemSortDao.findAll();
    }

    @Override
    public Map<String, Object> initAllHot(int pageNo, int rows, String select){
        return problemDao.initAllHot(pageNo,rows,select);
    }

    @Override
    public List<ProblemSort> PageFindSort(int start, int end) {
        return problemSortDao.PageFindSort(start,end);
    }

    @Override
    public List<Problem> findPageTenRows(int start, int end,int sortId) {
        return problemDao.findPageTenRows(start,end,sortId);
    }

    @Override
    public Map<String, Object> pageFindAllProblemBySortId(int sortId, int pageNo, int rows, int state) {
        return problemDao.pageFindAllProblemBySortId( sortId,  pageNo,  rows,  state);
    }

    @Override
    public Problem findById(Integer id) {
        return problemDao.findById(id);
    }

    @Override
    public List<Answer> findAllAnswerByProblemId(Integer id) {
        return problemDao.findAllAnswerByProblemId(id);
    }

    @Override
    public void addAnswer(Answer answer) {
        problemDao.addAnswer(answer);
    }

    @Override
    public void updateProblemAnswerNumber(Integer id) {
        problemDao.updateProblemAnswerNumber(id);
    }

    @Override
    public void updateSupport(Integer id,int number) {
        problemDao.updateSupport(id,number);
    }

    @Override
    public void updateOppose(Integer id, int support) {
        problemDao.updateOppose(id,support);
    }

    @Override
    public Map<String, Object> allHotProblemPage(int pageNo, int rows, int state) {
        return problemDao.allHotProblemPage(pageNo,rows,state);
    }

    @Override
    public Map<String, Object> findNewProblemPage(int pageNo, int rows, int state) {
        return problemDao.findNewProblemPage(pageNo,rows,state);
    }

    @Override
    public List<Problem> serach(String keyword, int state) {
        return problemDao.serach(keyword,state);
    }

    @Override
    public Map<String, Object> findMyProblem(Integer id, int state, int pageNo, int rows) {
        return problemDao.findMyProblem(id,state,pageNo,rows);
    }

    @Override
    public void deleteMyProblem(Integer id, int state) {
        problemDao.deleteMyProblem(id,state);
    }

    @Override
    public Map<String, Object> findAlreadySolve(Integer id, int state, int pageNo, int rows) {
        return problemDao.findAlreadySolve(id,state,pageNo,rows);
    }

    @Override
    public Map<String, Object> findMyTakePartIn(Integer id, int state, int pageNo, int rows) {
        return null;
    }

    @Override
    public Map<String, Object> findUserAllProblem(int pageNo, int rows) {
        return problemDao.findUserAllProblem(pageNo,rows);
    }

    @Override
    public void delete(Integer id) {
        problemDao.delete(id);
    }

}
