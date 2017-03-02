package com.zwl.dao;


import com.zwl.entity.Answer;
import com.zwl.entity.Problem;

import java.util.List;
import java.util.Map;

/**
 * author zwl
 * create Date 2016/12/14
 */
public interface IProblemDao {

 void save(Problem problem);

 Map<String,Object> initAllHot(int pageNo,int rows,String select);

 List<Problem> findPageTenRows(int start, int end,int sortId);
 Map<String,Object> pageFindAllProblemBySortId(int sortId, int pageNo, int rows, int state);

 Problem findById(Integer id);

 List<Answer> findAllAnswerByProblemId(Integer id);

 void addAnswer(Answer answer);

 void updateProblemAnswerNumber(Integer id);

 void updateSupport(Integer id,int number);

 void updateOppose(Integer id, int opp);

 Map<String,Object> allHotProblemPage(int pageNo, int rows, int state);

 Map<String,Object> findNewProblemPage(int pageNo, int rows, int state);
 List<Problem> serach(String keyword, int state);

 Map<String,Object> findMyProblem(Integer id, int state, int pageNo, int rows);

 void deleteMyProblem(Integer id, int state);

 Map<String,Object> findAlreadySolve(Integer id, int state, int pageNo, int rows);

 Map<String,Object> findUserAllProblem(int pageNo, int rows);

 void delete(Integer id);
}
