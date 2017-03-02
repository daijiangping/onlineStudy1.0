package com.zwl.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zwl.entity.Answer;
import com.zwl.entity.Problem;
import com.zwl.entity.ProblemSort;
import com.zwl.entity.User;
import com.zwl.service.IProblemService;
import com.zwl.util.FileUpload;
import org.apache.struts2.ServletActionContext;

import java.util.*;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class ProblemAction extends ActionSupport {
    private Problem problem;
    private IProblemService problemService;
    private ProblemSort problemSort;
    private Answer answer;
    private int state;
    private int pageNo;//第几页数据
    private int rows;//一页显示多少条
    private Map<String, Object> pageMap = null;//分页所有数据
    private List<Problem> serachProblemsList = null;
    private String op;
    /**
     * 用户问题管理
     */
    public String findUserAllProblem(){
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if(userInfo!=null){
            if(pageNo<=0){
                pageNo=1;
            }
            state=0;//默认正常状态
            rows = 12;//一页显示12行
            pageMap = problemService.findUserAllProblem(pageNo,rows);
        }
        return "myProblemListPage";
    }
  /*  public String MyTakePartIn(){
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if(userInfo!=null){
            if(pageNo<=0){
                pageNo=1;
            } state=0;//默认正常状态
            rows = 12;//一页显示12行
        pageMap = problemService.MyTakePartIn(user);
        return null;
    }*/
    /***
     * 删除我的提问
     * @return
     */
    public String deleteMyProblem(){

        if(problem!=null){
            if("adminDelete".equals(op)){
                //管理员物理删除
                problemService.delete(problem.getId());
            }else{
                //用户逻辑删除
                state = -1; //删除状态
                problemService.deleteMyProblem(problem.getId(),state);
            }

        }
        return null;
    }
    /**
     * 分页查找我的提问
     * @return
     */
    public String findMyProblem(){
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if(userInfo!=null){
            if(pageNo<=0){
                pageNo=1;
            }
            String op = ServletActionContext.getRequest().getParameter("op");
            System.out.println("操作："+op);
                if("all".equals(op)){//我的全部提问
                    state=0;//默认正常状态
                    rows = 12;//一页显示12行
                    System.out.println("用户ID："+userInfo.getId()+""+state+""+pageNo+""+ rows);
                    pageMap = problemService.findMyProblem(userInfo.getId(),state,pageNo, rows);//用户ID  状态  页码编号 一页显示多少行
                }else if("ok".equals(op)){//查找已经解决
                    state = 0;
                    rows = 12;
                    pageMap = problemService.findAlreadySolve(userInfo.getId(),state,pageNo,rows);
                }else if("takePartIn".equals(op)){
                    state = 0;
                    rows = 12;
                    pageMap = problemService.findMyTakePartIn(userInfo.getId(),state,pageNo,rows);
                }

        }
        return "myProblemListPage";
    }


    /**
     * 搜索
     * @return
     */
    public String serach(){
        String keyword = ServletActionContext.getRequest().getParameter("keyword");
        if(keyword!=""&&keyword!=null){
            state = 0;//正常状态
            serachProblemsList = problemService.serach(keyword,state);
            ServletActionContext.getRequest().setAttribute("keyword",keyword);
        }
        return "wendaPage";
    }
    /**
     * 顶一下
     * @return
     */
    public String updateSupport(){
        problemService.updateSupport(answer.getId(),answer.getSupport());
        return null;
    }
    /**
     * 踩一下
     * @return
     */
    public String updateOppose(){
        problemService.updateOppose(answer.getId(),answer.getSupport());
        return null;
    }
    /**
     * 添加评论
     * @return
     */
    public String addAnswer(){
        System.out.println("回复答案呗调用..");
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if(answer!=null&&problem!=null&&userInfo!=null){
            answer.setProblem(problem);
            answer.setUser(userInfo);
            answer.setAddTime(new Date());
            problemService.addAnswer(answer);
            //修改问题答案数量
            problemService.updateProblemAnswerNumber(problem.getId());
        }
        return null;
    }
    /**
     * 从分类下的所有列表中查找问题内容
     *
     * @return
     */
    public String findBySortIdAndId() {
        if(problem!=null){
            problem = problemService.findById(problem.getId());
            List<Answer> answers = problemService.findAllAnswerByProblemId(problem.getId());
            ServletActionContext.getRequest().setAttribute("answers",answers);
        }
        return "problemInfo";
    }

    /**
     * 根据分类ID分页查找问题列表
     *
     * @return
     */
    public String pageFindAllProblem() {
        if (problemSort != null) {
            if (pageNo <= 0) {
                pageNo = 1;
            }
            rows = 12;
            int sortId = problemSort.getId();
            state = 0;//查找正常状态
            if(sortId==0){//查找全部最新
                pageMap = problemService.findNewProblemPage(pageNo, rows, state);
            }else if(sortId==-1){//查找全部最热
                pageMap = problemService.allHotProblemPage(pageNo, rows, state);
            }else{
                pageMap = problemService.pageFindAllProblemBySortId(sortId, pageNo, rows, state);
            }

        }
        return "sortProblemPage";
    }

    /**
     * 查找热门信息
     *
     * @return
     */
  /*  public String findProductInfo() {
        Map application = ActionContext.getContext().getApplication();
        Map obj = (Map) application.get("mapHot");
        List<Problem> problemList = (List<Problem>) obj.get("dataList");
        for (Problem item : problemList) {
            if (item.getId().equals(problem.getId())) {
                problem = item;
                break;
            }
        }
        return "problemInfo";
    }*/

    /**
     * 初始化首页七条数据
     *
     * @return
     */
    public String initAllHot() {
        Map application = ActionContext.getContext().getApplication();
        Object mapHotObj = application.get("mapHot");
        Object sortsObj = application.get("sorts");
        Object initIndexSortPage = application.get("initIndexSortPageData");

        if (mapHotObj != null) {
            //初始化首页热门七条数据
            System.out.println("对象为空！");
            Map<String, Object> mapHot = problemService.initAllHot(1, 8, null);
            application.put("mapHot", mapHot);
        }
        if (sortsObj != null) {
            //初始化发布所有分类
            List<ProblemSort> sorts = problemService.findAllProblemSort();
            application.put("sorts", sorts);
        }
        if (initIndexSortPage != null) {
            //初始化首页前几个热门分类
            List<ProblemSort> initIndexSortPageData = problemService.PageFindSort(0, 5);
            application.put("initIndexSortPageData", initIndexSortPageData);
            Map<String, Object> sortPageData = new HashMap<String, Object>();
            //初始化分类出来的数据（默认显示15条）
            for (int i = 0; i < initIndexSortPageData.size(); i++) {
                List<Problem> problems = problemService.findPageTenRows(0, 15, initIndexSortPageData.get(i).getId());
                sortPageData.put("sort" + i, problems);
            }
            application.put("sortPageData", sortPageData);
        }

        return null;

    }

    /**
     * 发布提问
     *
     * @return
     */
    public String add() {
        System.out.println("add被调用...");
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if (userInfo != null) {
            //用户已登录
            if (problem != null && problemSort != null) {
                problem.setAddTime(new Date());
                System.out.println(problemSort.getId());
                problem.setProblemSort(problemSort);
                problem.setState(0);//我的最新发布
                problem.setUser(userInfo);
                try {
                    problemService.save(problem);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                state = 1;//发布成功
            } else {
                state = 0;//发布失败 原因：未知
            }
        } else {
            System.out.println("not login");
            state = -1;//用户未登录状态
        }

        return "state";
    }


    //get and set......................................
    public void setProblemService(IProblemService problemService) {
        this.problemService = problemService;
    }

    public Problem getProblem() {
        return problem;
    }

    public ProblemSort getProblemSort() {
        return problemSort;
    }

    public void setProblemSort(ProblemSort problemSort) {
        this.problemSort = problemSort;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public Map<String, Object> getPageMap() {
        return pageMap;
    }

    public void setPageMap(Map<String, Object> pageMap) {
        this.pageMap = pageMap;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public List<Problem> getSerachProblemsList() {
        return serachProblemsList;
    }

    public void setSerachProblemsList(List<Problem> serachProblemsList) {
        this.serachProblemsList = serachProblemsList;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }
}
