package com.zwl.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * author zwl
 * create Date 2016/12/19
 */
public class Role {
    private Integer id;//角色ID
    private String name;//角色名
    private int state;//状态
    private Date addTime;
    private Set<User> users  = new HashSet<User>();//角色下所有用户
    private Set<Authority> authoritys= new HashSet<Authority>();//角色下所有权限

    public Role() {
    }

    public Role(Integer id) {
        this.id = id;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Set<Authority> getAuthoritys() {
        return authoritys;
    }

    public void setAuthoritys(Set<Authority> authoritys) {
        this.authoritys = authoritys;
    }
}
