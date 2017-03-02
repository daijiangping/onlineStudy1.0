package com.zwl.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zwl.entity.ProblemSort;
import com.zwl.entity.User;
import com.zwl.service.IProblemService;
import com.zwl.service.IUserService;
import com.zwl.util.FileUpload;
import com.zwl.util.MD5Utils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.util.List;

/**
 * author zwl
 * create Date 2016/12/14
 */
public class UserAction extends ActionSupport {
    private User user = null;
    private IUserService userService;
    private IProblemService problemService;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private int state;
    public String updateHead(){
        User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
        if(userInfo!=null){
            String saveName = FileUpload.upload(uploadFileName,upload,"upload/user");
            if(saveName!=null){
                userService.updateHead(userInfo.getId(),saveName);
                userInfo.setHeadImg(saveName);
                ActionContext.getContext().getSession().put("userInfo",userInfo);
                return "updateHeadSuc";
            }else {
                return "updateHeadFail";
            }

        }
        return "updateHeadFail";
    }
    public String updatePwd(){
       if(user!=null){
           User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
           if(userInfo!=null){
                if(userInfo.getPassword().equals(MD5Utils.toMD5(user.getPassword()))){
                    //原始密码输入正确
                    String newPwd = ServletActionContext.getRequest().getParameter("newPwd");
                    userService.updatePwd(userInfo.getId(),MD5Utils.toMD5(newPwd));
                    state = 1;//修改成功
                }else{
                    state = 2;//原密码输入错误
                }
           }
       }
        return "state";
    }
    /**
     * 修改呢成
     * @return
     */
    public String updateRealName(){
        if(user!=null){
            User userInfo = (User) ActionContext.getContext().getSession().get("userInfo");
            if (userInfo!=null){
                userService.updateRealName(userInfo.getId(),user.getRealName());
                userInfo.setRealName(user.getRealName());
                ActionContext.getContext().getSession().put("userInfo",userInfo);
            }
        }
        return null;
    }
    /**
     * 登录
     * @return
     */
    public String login(){
        if(user!=null){
            User userInfo = userService.login(user);
            if(userInfo!=null){
                 state = 1;//登录成功
                ActionContext.getContext().getSession().put("userInfo",userInfo);

            }
        }
        return "state";
    }
    /**
     * 检查用户名是否注册过
     * @return
     */
    public String checkUserNameIsExist(){
        if(user!=null){
            boolean flag = userService.checkUserNameIsExist(user.getUserName());
            if (flag) {
                state = 2;//用户名存在
            }
        }
        return "state";
    }
    /**
     * 注册
     *
     * @return
     */
    public String register() {
        if (user != null) {
            boolean flag = userService.checkUserNameIsExist(user.getUserName());
            if (flag) {
                state = 2;//用户名存在
            } else {
                userService.register(user);
                state = 1;//注册成功！
            }
        }
        return "state";
    }

    //get and set.........
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setProblemService(IProblemService problemService) {
        this.problemService = problemService;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

}
