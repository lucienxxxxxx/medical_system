package com.gzhu.medical_system.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.modules.system.entity.User;

/**
 * @ClassName UserService
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 6:58
 * @Version 1.0版本
 */

public interface IUserService extends IService<User> {
    /**
     * 保存或更新用户
     * @param user
     * @return
     */
    PageData<User> getPage(int page, int limit, User user);
    public int saveOrUpdateUser(User user);
    void resetPassword(User user,String password);
}
