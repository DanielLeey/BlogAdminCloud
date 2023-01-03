package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.SubjectItemMapper;
import com.lee.article.service.SubjectItemService;
import com.lee.common.entity.SubjectItem;
import org.springframework.stereotype.Service;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:32
 * @Version: 1.0
 */
@Service("subjectItemService")
public class SubjectItemServiceImpl extends ServiceImpl<SubjectItemMapper, SubjectItem> implements SubjectItemService {

}
