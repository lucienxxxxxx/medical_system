package com.gzhu.medical_system.modules.index.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gzhu.medical_system.modules.system.entity.User;

/**
 * @ClassName LoginService
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 17:18
 * @Version 1.0版本
 */
public interface ILoginService extends IService<User> {
    public void checkLogin(User user);
}
