package com.zwl.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class User {
    //基本信息
    private Integer id;//用户ID
    private String userName;//用户名
    private String password;//密码
    private String headImg = "man.jpg";//头像
    //详细信息
    private String tell;//电话
    private String realName;//用户真实名字
    private Date addTime;//注册时间
    private Role role;//对应的角色
    private int state;//用户状态
    private Set<Problem> problems = new HashSet<Problem>();//用户发布的所用问题

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Set<Problem> getProblems() {
        return problems;
    }

    public void setProblems(Set<Problem> problems) {
        this.problems = problems;
    }
}
