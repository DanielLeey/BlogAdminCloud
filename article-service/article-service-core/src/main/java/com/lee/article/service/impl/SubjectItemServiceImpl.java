package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.SubjectItemMapper;
import com.lee.article.service.SubjectItemService;
import com.lee.common.Request.SubjectItemEditRequest;
import com.lee.common.entity.SubjectItem;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:32
 * @Version: 1.0
 */
@Service("subjectItemService")
public class SubjectItemServiceImpl extends ServiceImpl<SubjectItemMapper, SubjectItem> implements SubjectItemService {

    @Autowired
    private SubjectItemMapper subjectItemMapper;

    @Override
    public Boolean editSubject(List<SubjectItemEditRequest> subjectItemRequests) {
        AtomicInteger count = new AtomicInteger();
        subjectItemRequests.forEach(subjectItemEditRequest -> {
            SubjectItem subjectItem = new SubjectItem();
            BeanUtils.copyProperties(subjectItemEditRequest, subjectItem);
            subjectItem.setUpdateTime(new Date());
            subjectItemMapper.updateById(subjectItem);
            count.getAndIncrement();
        });
        return count.get() == subjectItemRequests.size();
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        final int count = subjectItemMapper.deleteBatch(uids);
        return count > 0;
    }
}
