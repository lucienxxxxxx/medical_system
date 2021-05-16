package com.gzhu.medical_system.modules.system.controller;

import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.base.model.ResonseData;
import com.gzhu.medical_system.modules.system.entity.User;
import com.gzhu.medical_system.modules.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName UserController
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 17:27
 * @Version 1.0版本
 */
@Controller
@RequestMapping("/user/")
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("/info")
    public String info(){
        return "system/user/info";
    }
    @GetMapping("index")
    public String index() {
        return "system/user/index";
    }

    @GetMapping("saveOrUpdate")
    @ResponseBody
    public ResonseData saveOrUpdate(User user) {
        ResonseData data = new ResonseData();
        try {
            if (user.getId()!=null&&user.getId()>0){
                this.userService.updateById(user);
                data.setMsg("修改成功");
            }else{
                this.userService.save(user);
                data.setMsg("保存成功");
            }



            data.setCode(200);

        } catch (Exception e) {
            e.printStackTrace();
            data.setMsg("失败了:(");
        }
        return data;
    }


    @GetMapping("list.json")
    @ResponseBody
    public PageData<User> list(User user, int page, int limit) {
        return this.userService.getPage(page, limit,user);
    }

    @PostMapping("delete")
    @ResponseBody
    public ResonseData delete(int id){
        ResonseData data =new ResonseData();
        try{
            this.userService.removeById(id);
            data.setCode(200);
            data.setMsg("删除成功！");
        }catch (Exception e){
            data.setMsg("删除失败！");
            e.printStackTrace();
        }
        return data;
    }

    @PostMapping("resetPassword")
    @ResponseBody
    public ResonseData resetPassword(User user){
        ResonseData data =new ResonseData();
        try{
            String password="s123456";
            this.userService.resetPassword(user,password);
            data.setCode(200);
            data.setMsg("重置成功！");
        }catch (Exception e){
            data.setMsg("重置失败！");
            e.printStackTrace();
        }
        return data;
    }
}
