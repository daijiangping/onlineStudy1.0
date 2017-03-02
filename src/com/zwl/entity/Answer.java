package com.zwl.entity;

import java.util.Date;

/**
 * author zwl
 * create Date 2016/12/20
 * 答案表
 */
public class Answer {
    private Integer id;
    private String content;//内容
    private Date addTime;//评论时间
    private User user;//对应的用户
    private Problem problem;//对应的问题
    private int support = 0;//支持量
    private int oppose  = 0;//反对量

    public int getSupport() {
        return support;
    }

    public void setSupport(int support) {
        this.support = support;
    }

    public int getOppose() {
        return oppose;
    }

    public void setOppose(int oppose) {
        this.oppose = oppose;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Problem getProblem() {
        return problem;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }
}
