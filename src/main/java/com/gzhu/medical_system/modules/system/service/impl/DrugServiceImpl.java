package com.gzhu.medical_system.modules.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.modules.system.entity.Drug;
import com.gzhu.medical_system.modules.system.mapper.DrugMapper;
import com.gzhu.medical_system.modules.system.service.IDrugService;
import org.springframework.stereotype.Service;

/**
 * @ClassName DrugService
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 20:22
 * @Version 1.0版本
 */
@Service
public class DrugServiceImpl extends ServiceImpl<DrugMapper, Drug> implements IDrugService {

    @Override
    public PageData<Drug> getPage(Drug drug, int page, int limit) {
        PageData<Drug> drugPage =new PageData<Drug>();
        Page pageInfo =new Page(page,limit);
        QueryWrapper<Drug> queryWrapper =new QueryWrapper<>();
        if (drug.getMname()!=null&&drug.getMname().length()>0){
            queryWrapper.like("mname",drug.getMname());
        }
        if (drug.getPid()!=null){
            queryWrapper.like("pid",drug.getPid());
        }
        if (drug.getPcompany()!=null&&drug.getPcompany().length()>0){
            queryWrapper.like("pcompany",drug.getPcompany());
        }
        IPage iPage=this.page(pageInfo,queryWrapper);
        drugPage.setCount(iPage.getTotal());
        drugPage.setData(iPage.getRecords());
        drugPage.setCode(0);
        drugPage.setMessage("");
        return drugPage;
    }

}
