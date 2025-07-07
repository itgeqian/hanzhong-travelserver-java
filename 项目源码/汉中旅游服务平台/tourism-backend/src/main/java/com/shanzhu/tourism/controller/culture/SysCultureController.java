package com.shanzhu.tourism.controller.culture;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysCulture;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysCultureService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 汉文化活动Controller
 *
 */
@Controller
@ResponseBody
@RequestMapping("culture")
public class SysCultureController {

    @Resource
    private SysCultureService sysCultureService;

    /** 分页获取汉文化活动 */
    @PostMapping("getSysCulturePage")
    public Result getSysCulturePage(@RequestBody SysCulture sysCulture) {
        Page<SysCulture> page = new Page<>(sysCulture.getPageNumber(), sysCulture.getPageSize());
        QueryWrapper<SysCulture> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(sysCulture.getState() != null, SysCulture::getState, sysCulture.getState())
                .like(StringUtils.isNotBlank(sysCulture.getName()), SysCulture::getName, sysCulture.getName())
                .like(StringUtils.isNotBlank(sysCulture.getCultureType()), SysCulture::getCultureType, sysCulture.getCultureType())
                .orderByDesc(SysCulture::getCreateTime);
        Page<SysCulture> sysCulturePage = sysCultureService.page(page, queryWrapper);
        return Result.success(sysCulturePage);
    }

    @GetMapping("getSysCultureList")
    public Result getSysCultureList() {
        QueryWrapper<SysCulture> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysCulture::getState, 1).orderByDesc(SysCulture::getCreateTime);
        List<SysCulture> cultureList = sysCultureService.list(queryWrapper);
        return Result.success(cultureList);
    }

    /** 根据id获取汉文化活动 */
    @GetMapping("getSysCultureById")
    public Result getSysCultureById(@RequestParam("id") String id) {
        SysCulture sysCulture = sysCultureService.getById(id);
        return Result.success(sysCulture);
    }

    /** 保存汉文化活动 */
    @PostMapping("saveSysCulture")
    public Result saveSysCulture(@RequestBody SysCulture sysCulture) {
        boolean save = sysCultureService.save(sysCulture);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑汉文化活动 */
    @PostMapping("editSysCulture")
    public Result editSysCulture(@RequestBody SysCulture sysCulture) {
        boolean save = sysCultureService.updateById(sysCulture);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除汉文化活动 */
    @GetMapping("removeSysCulture")
    @Transactional(rollbackFor = Exception.class)
    public Result removeSysCulture(@RequestParam("ids") String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysCultureService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("汉文化活动id不能为空！");
        }
    }
} 