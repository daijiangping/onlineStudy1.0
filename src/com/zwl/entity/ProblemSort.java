package com.zwl.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * author zwl
 * create Date 2016/12/20
 * 问题分类实体
 */
public class ProblemSort {
    private Integer id;
    private String name;
    private Set<Problem> problems = new HashSet<Problem>();
    private int state;

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    private Date addTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Problem> getProblems() {
        return problems;
    }

    public void setProblems(Set<Problem> problems) {
        this.problems = problems;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
