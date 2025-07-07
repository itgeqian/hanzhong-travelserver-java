package com.shanzhu.tourism.controller.message;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysMessage;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysMessageService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 用户留言Controller
 */
@Controller
@ResponseBody
@RequestMapping("message")
public class SysMessageController {

    @Resource
    private SysMessageService sysMessageService;

    /** 分页获取用户留言 */
    @PostMapping("getSysMessagePage")
    public Result getSysMessagePage(@RequestBody SysMessage sysMessage) {
        Page<SysMessage> page = new Page<>(sysMessage.getPageNumber(), sysMessage.getPageSize());
        QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .like(StringUtils.isNotBlank(sysMessage.getName()), SysMessage::getName, sysMessage.getName())
                .like(StringUtils.isNotBlank(sysMessage.getSubject()), SysMessage::getSubject, sysMessage.getSubject())
                .eq(sysMessage.getStatus() != null, SysMessage::getStatus, sysMessage.getStatus())
                .orderByDesc(SysMessage::getCreateTime);
        Page<SysMessage> sysMessagePage = sysMessageService.page(page, queryWrapper);
        return Result.success(sysMessagePage);
    }

    @GetMapping("getSysMessageList")
    public Result getSysMessageList() {
        QueryWrapper<SysMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().orderByDesc(SysMessage::getCreateTime);
        List<SysMessage> messageList = sysMessageService.list(queryWrapper);
        return Result.success(messageList);
    }

    /** 根据id获取用户留言 */
    @GetMapping("getSysMessageById")
    public Result getSysMessageById(@RequestParam("id") String id) {
        SysMessage sysMessage = sysMessageService.getById(id);
        return Result.success(sysMessage);
    }

    /** 保存用户留言 */
    @PostMapping("saveSysMessage")
    public Result saveSysMessage(@RequestBody SysMessage sysMessage) {
        // 设置默认状态为未处理
        if (sysMessage.getStatus() == null) {
            sysMessage.setStatus(0);
        }
        boolean save = sysMessageService.save(sysMessage);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 处理用户留言 */
    @PostMapping("handleSysMessage")
    public Result handleSysMessage(@RequestBody SysMessage sysMessage) {
        // 设置处理时间为当前时间
        sysMessage.setHandleTime(new Date());
        boolean save = sysMessageService.updateById(sysMessage);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除用户留言 */
    @GetMapping("removeSysMessage")
    @Transactional(rollbackFor = Exception.class)
    public Result removeSysMessage(@RequestParam("ids") String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysMessageService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("留言id不能为空！");
        }
    }
} 