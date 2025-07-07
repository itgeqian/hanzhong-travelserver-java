package com.shanzhu.tourism.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import java.util.Date;
import java.io.Serializable;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 汉文化活动
 *

 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@TableName("sys_culture")
public class SysCulture implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 活动名称
     */
    private String name;

    /**
     * 活动费用
     */
    private Float price;

    /**
     * 简介
     */
    private String introduce;

    /**
     * 详细介绍
     */
    private String content;

    /**
     * 图片
     */
    private String images;

    /**
     * 活动类型（传统节日、民俗表演、文化展览等）
     */
    private String cultureType;

    /**
     * 活动地点
     */
    private String location;

    /**
     * 活动时间
     */
    private String activityTime;

    /**
     * 参与人数限制
     */
    private Integer maxParticipants;

    /**
     * 联系电话
     */
    private String contactPhone;

    /**
     * 状态 0-下架 1-上架
     */
    private Integer state;

    /**
     * 创建者
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新者
     */
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    /**
     * 更新时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(exist = false)
    private Integer pageNumber;

    @TableField(exist = false)
    private Integer pageSize;
} 