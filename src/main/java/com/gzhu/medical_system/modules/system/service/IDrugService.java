package com.gzhu.medical_system.modules.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.modules.system.entity.Drug;

/**
 * @ClassName IDrugService
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 20:21
 * @Version 1.0版本
 */
public interface IDrugService extends IService<Drug> {
    public PageData<Drug> getPage(Drug drug, int page, int limit);
}
