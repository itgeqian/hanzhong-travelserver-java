package com.shanzhu.tourism.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shanzhu.tourism.domain.SysMessage;
import com.shanzhu.tourism.mapper.SysMessageMapper;
import com.shanzhu.tourism.service.SysMessageService;
import org.springframework.stereotype.Service;

/**
 * 用户留言Service实现类
 */
@Service
public class SysMessageServiceImpl extends ServiceImpl<SysMessageMapper, SysMessage> implements SysMessageService {
} 