package com.gzhu.medical_system.modules.system.controller;

import com.gzhu.medical_system.base.model.PageData;
import com.gzhu.medical_system.base.model.ResonseData;
import com.gzhu.medical_system.modules.system.entity.Drug;
import com.gzhu.medical_system.modules.system.service.IDrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName MedicalController
 * @author: lucine
 * @Description TODO
 * @date 2021/5/15 19:32
 * @Version 1.0版本
 */
@Controller
@RequestMapping("/medical/")
public class MedicalController {

    @Autowired
    public IDrugService drugService;

    @GetMapping("index")
    public String index(){
        return "system/medical/index";
    }

    @GetMapping("list.json")
    @ResponseBody
    public PageData<Drug> list(Drug drug, int page, int limit) {
        return this.drugService.getPage(drug,page,limit);
    }

    @GetMapping("saveOrUpdate")
    @ResponseBody
    public ResonseData saveOrUpdate(Drug drug) {
        ResonseData data = new ResonseData();
        try {
            if (drug.getId()!=null&&drug.getId()>0){
                this.drugService.updateById(drug);
                data.setMsg("修改成功");
            }else{
                this.drugService.save(drug);
                data.setMsg("保存成功");
            }
            data.setCode(200);
        } catch (Exception e) {
            e.printStackTrace();
            data.setMsg("失败了:(");
        }
        return data;
    }

    @PostMapping("delete")
    @ResponseBody
    public ResonseData delete(int id){
        ResonseData data =new ResonseData();
        try{
            this.drugService.removeById(id);
            data.setCode(200);
            data.setMsg("删除成功！");
        }catch (Exception e){
            data.setMsg("删除失败！");
            e.printStackTrace();
        }
        return data;
    }
}


