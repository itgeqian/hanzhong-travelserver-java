package com.shanzhu.tourism.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 用户留言实体类
 */
@Data
@TableName("sys_message")
public class SysMessage extends BaseEntity {

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 留言人姓名
     */
    @TableField("name")
    private String name;

    /**
     * 联系电话
     */
    @TableField("phone")
    private String phone;

    /**
     * 电子邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 留言主题
     */
    @TableField("subject")
    private String subject;

    /**
     * 留言内容
     */
    @TableField("message")
    private String message;

    /**
     * 处理状态（0-未处理，1-已处理）
     */
    @TableField("status")
    private Integer status = 0;

    /**
     * 管理员回复
     */
    @TableField("reply")
    private String reply;

    /**
     * 处理人
     */
    @TableField("handler")
    private String handler;

    /**
     * 处理时间
     */
    @TableField("handle_time")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date handleTime;

    /**
     * 分页参数 - 页码
     */
    @TableField(exist = false)
    private Integer pageNumber;

    /**
     * 分页参数 - 每页大小
     */
    @TableField(exist = false)
    private Integer pageSize;
} 