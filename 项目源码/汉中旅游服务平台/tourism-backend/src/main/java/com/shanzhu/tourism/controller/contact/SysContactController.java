package com.shanzhu.tourism.controller.contact;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysContact;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysContactService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 联系我们Controller
 *
 */
@Controller
@ResponseBody
@RequestMapping("contact")
public class SysContactController {

    @Resource
    private SysContactService sysContactService;

    /** 分页获取联系我们 */
    @PostMapping("getSysContactPage")
    public Result getSysContactPage(@RequestBody SysContact sysContact) {
        Page<SysContact> page = new Page<>(sysContact.getPageNumber(), sysContact.getPageSize());
        QueryWrapper<SysContact> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(sysContact.getState() != null, SysContact::getState, sysContact.getState())
                .like(StringUtils.isNotBlank(sysContact.getTitle()), SysContact::getTitle, sysContact.getTitle())
                .orderByAsc(SysContact::getSortOrder)
                .orderByDesc(SysContact::getCreateTime);
        Page<SysContact> sysContactPage = sysContactService.page(page, queryWrapper);
        return Result.success(sysContactPage);
    }

    @GetMapping("getSysContactList")
    public Result getSysContactList() {
        QueryWrapper<SysContact> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysContact::getState, 1)
                .orderByAsc(SysContact::getSortOrder)
                .orderByDesc(SysContact::getCreateTime);
        List<SysContact> contactList = sysContactService.list(queryWrapper);
        return Result.success(contactList);
    }

    /** 根据id获取联系我们 */
    @GetMapping("getSysContactById")
    public Result getSysContactById(@RequestParam("id") String id) {
        SysContact sysContact = sysContactService.getById(id);
        return Result.success(sysContact);
    }

    /** 保存联系我们 */
    @PostMapping("saveSysContact")
    public Result saveSysContact(@RequestBody SysContact sysContact) {
        boolean save = sysContactService.save(sysContact);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑联系我们 */
    @PostMapping("editSysContact")
    public Result editSysContact(@RequestBody SysContact sysContact) {
        boolean save = sysContactService.updateById(sysContact);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除联系我们 */
    @GetMapping("removeSysContact")
    @Transactional(rollbackFor = Exception.class)
    public Result removeSysContact(@RequestParam("ids") String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysContactService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("联系我们id不能为空！");
        }
    }
} 