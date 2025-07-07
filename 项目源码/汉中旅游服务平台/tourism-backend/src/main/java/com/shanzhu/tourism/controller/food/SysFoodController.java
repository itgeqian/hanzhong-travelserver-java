package com.shanzhu.tourism.controller.food;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysFood;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysFoodService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 美食推荐Controller
 *
 */
@Controller
@ResponseBody
@RequestMapping("food")
public class SysFoodController {

    @Resource
    private SysFoodService sysFoodService;

    /** 分页获取美食推荐 */
    @PostMapping("getSysFoodPage")
    public Result getSysFoodPage(@RequestBody SysFood sysFood) {
        Page<SysFood> page = new Page<>(sysFood.getPageNumber(), sysFood.getPageSize());
        QueryWrapper<SysFood> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(sysFood.getState() != null, SysFood::getState, sysFood.getState())
                .like(StringUtils.isNotBlank(sysFood.getName()), SysFood::getName, sysFood.getName())
                .like(StringUtils.isNotBlank(sysFood.getFoodType()), SysFood::getFoodType, sysFood.getFoodType())
                .orderByDesc(SysFood::getCreateTime);
        Page<SysFood> sysFoodPage = sysFoodService.page(page, queryWrapper);
        return Result.success(sysFoodPage);
    }

    @GetMapping("getSysFoodList")
    public Result getSysFoodList() {
        QueryWrapper<SysFood> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysFood::getState, 1).orderByDesc(SysFood::getCreateTime);
        List<SysFood> foodList = sysFoodService.list(queryWrapper);
        return Result.success(foodList);
    }

    /** 根据id获取美食推荐 */
    @GetMapping("getSysFoodById")
    public Result getSysFoodById(@RequestParam("id") String id) {
        SysFood sysFood = sysFoodService.getById(id);
        return Result.success(sysFood);
    }

    /** 保存美食推荐 */
    @PostMapping("saveSysFood")
    public Result saveSysFood(@RequestBody SysFood sysFood) {
        boolean save = sysFoodService.save(sysFood);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑美食推荐 */
    @PostMapping("editSysFood")
    public Result editSysFood(@RequestBody SysFood sysFood) {
        boolean save = sysFoodService.updateById(sysFood);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除美食推荐 */
    @GetMapping("removeSysFood")
    @Transactional(rollbackFor = Exception.class)
    public Result removeSysFood(@RequestParam("ids") String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysFoodService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("美食推荐id不能为空！");
        }
    }
} 