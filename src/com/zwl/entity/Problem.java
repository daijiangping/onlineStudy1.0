package com.zwl.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * author zwl
 * create Date 2016/12/19
 * 问题表
 */
public class Problem {
    private Integer id ;//ID
    private String title;//标题
    private String content;//内容
    private Date addTime;//发布时间
    private int state = 0;//状态（默认为正常状态）
    private User user;//发布的用户
    private ProblemSort problemSort;//对应的分类
    private Set<Answer> answers = new HashSet<Answer>();//一个问题对应多个答案
    private int answerNumber = 0;//答案数量

    public int getAnswerNumber() {
        return answerNumber;
    }

    public void setAnswerNumber(int answerNumber) {
        this.answerNumber = answerNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ProblemSort getProblemSort() {
        return problemSort;
    }

    public void setProblemSort(ProblemSort problemSort) {
        this.problemSort = problemSort;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    @Override
    public String toString() {
        return "Problem{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", addTime=" + addTime +
                ", state=" + state +
                ", answerNumber=" + answerNumber +
                '}';
    }
}
