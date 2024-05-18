package com.controller;
import com.pj.User;
import com.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Usercontroller {
    @Resource
    private UserService userService;

    @RequestMapping("/userlogin")
    @ResponseBody
    public String login(User user,Model model) {
        User _user=userService.login(user);
        if(_user!=null&&_user.getPassword().equals(user.getPassword())) {
        model.addAttribute("user", user);
            return "密码正确，登录成功  \n(UTF-8:login success)";
        }
            return "密码错误，登录失败  \n(UTF-8:login failure)";
    }

    @RequestMapping("/userregister")
    @ResponseBody
    public String register(User user, Model model) {
        User _user=userService.login(user);
        if(_user==null)
        {
            userService.register(user);
            model.addAttribute("user", user);
            return "注册成功  \n(UTF-8:register success)  \n"+
              "您的账号(UTF-8:your username)  "+user.getUsername()+"\n"+
              "您的密码(UTF-8:your password)  "+user.getPassword();
        } else if(_user.getUsername().equals(_user.getUsername())==true){
            return "用户名重复  \n(UTF-8:username already taken)";
        }
        return "未知错误  \n(UTF-8:unknown error)";
    }

    @RequestMapping("/delete")
    public String delete(User user, Model model) {
        User _user=userService.login(user);
        if(_user!=null)
        {
            userService.delete(user);
            _user=userService.login(user);
            if(_user==null)
            return "注销成功  \n(UTF-8:delete success)";
        }
            return "未发现账户或注销失败  \n(UTF-8:cannot find username or delete failure)";
    }
    public String login(User user) {
        if(userService==null)
            System.out.println("kongde");

        User _user=userService.login(user);
        if(_user!=null){
            return "登录成功";
        }else {
            return "登录失败";
        }
    }



    public String register(User user) {
        User _user=userService.login(user);
        if(_user==null)
        {
            System.out.println("未发现重复账户");
            userService.register(user);
            //model.addAttribute("user", _user);
            return "注册成功"; }
        else
        if(_user.getUsername().equals(_user.getUsername())==true){
            return "用户名重复";
        }
        return "未知错误";
    }
    public String delete(User user) {
        User _user=userService.login(user);
        if(_user!=null)
        {
            System.out.println("发现待删除账户");
            userService.delete(user);
            _user=userService.login(user);
            if(_user==null)
                return "注销成功";
        }

        return "未发现账户或注销失败";
    }



}














