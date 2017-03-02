package com.zwl.service;

import com.zwl.entity.Answer;
import com.zwl.entity.Problem;
import com.zwl.entity.ProblemSort;
import com.zwl.entity.User;

import java.util.List;
import java.util.Map;

/**
 * author zwl
 * create Date 2016/12/14
 */
public interface IProblemService {

    void save(Problem problem);

    /**
     * 查找全部问题分类
     * @return
     */
    List<ProblemSort> findAllProblemSort();

    /**
     *  首页初始化七条最热门问答
     * @param pageNo
     * @param rows
     * @param select
     * @return
     */
    Map<String ,Object> initAllHot(int pageNo, int rows, String select);

    List<ProblemSort> PageFindSort(int start, int end);

    /**
     * 首页分页显示某个分类的数据 默认显示10条
     * @param start
     * @param end
     * @return
     */
    List<Problem> findPageTenRows(int start, int end,int sortId);

    /**
     * 分页查找问题根据问题分类ID（注册状态）
     * @param sortId
     * @param pageNo
     * @param rows
     * @return
     */
    Map<String,Object> pageFindAllProblemBySortId(int sortId, int pageNo, int rows,int state);

    /**
     * find byid
     * @param id
     * @return
     */
    Problem findById(Integer id);

    /**
     * 查找单个问题下的所有答案
     * @param id
     * @return
     */
    List<Answer> findAllAnswerByProblemId(Integer id);

    /**
     * 添加答案
     * @param answer
     */
    void addAnswer(Answer answer);

    /**
     * 修改问题答案数量
     * @param id
     */
    void updateProblemAnswerNumber(Integer id);

    void updateSupport(Integer id,int number);

    void updateOppose(Integer id, int support);

    Map<String,Object> allHotProblemPage(int pageNo, int rows, int state);

    Map<String,Object> findNewProblemPage(int pageNo, int rows, int state);

    /**
     * 搜索
     * @param keyword
     * @param state
     * @return
     */
    List<Problem>  serach(String keyword, int state);

    Map<String,Object> findMyProblem(Integer id, int state, int pageNo, int rows);

    /**
     * 删除我的问题（逻辑删除）
     * @param id
     * @param state
     */
    void deleteMyProblem(Integer id, int state);

    /**
     * 查找已经解决的问题（答案数量大于0）
     * @param id
     * @param state
     * @param pageNo
     * @param rows
     * @return
     */
    Map<String,Object> findAlreadySolve(Integer id, int state, int pageNo, int rows);

    /**
     * 查找我参与的（我回答过的）
     * @param id
     * @param state
     * @param pageNo
     * @param rows
     * @return
     */
    Map<String,Object> findMyTakePartIn(Integer id, int state, int pageNo, int rows);

    /**
     * 查找用户所有提问
     * @param pageNo
     * @param rows
     * @return
     */
    Map<String,Object> findUserAllProblem(int pageNo, int rows);

    void delete(Integer id);
}
