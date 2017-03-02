package com.zwl.entity;

import java.util.Date;

/**
 * author zwl
 * create Date 2016/12/20
 * 收藏表
 */
public class Collect {
    private Integer id;//收藏ID
    private Date addTime;//添加收藏时间
    private User user;//谁收藏的
    private Problem problem;//收藏的问题
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
