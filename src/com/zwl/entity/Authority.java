package com.zwl.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * author zwl
 * create Date 2016/12/19
 */
public class Authority {
    private Integer id;//权限ID
    private String name;//权限名
    private int state;//状态
    private Role role;//角色
    private String url;//功能url
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
