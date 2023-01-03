package com.lee.article.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lee.article.dao.SubjectMapper;
import com.lee.article.service.SubjectService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SubjectRequest;
import com.lee.common.bo.SubjectBO;
import com.lee.common.entity.Subject;
import com.lee.common.utils.UUidUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 10:00
 * @Version: 1.0
 */
@Service("subjectService")
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    @Override
    public List<SubjectBO> getList(BaseRequest baseRequest) {
        Page<Subject> page = new Page<>(baseRequest.getCurrentPage(), baseRequest.getPageSize());
        List<Subject> subjectList = page(page).getRecords();
        List<SubjectBO> subjectBOList = new ArrayList<>(subjectList.size());
        for (Subject subject : subjectList) {
            final SubjectBO subjectBO = new SubjectBO();
            BeanUtils.copyProperties(subject, subjectBO);
            final String fileUid = subject.getFileUid();
            subjectBO.setPhotoList(null);
            subjectBOList.add(subjectBO);
        }
        return subjectBOList;
    }

    @Override
    public Boolean editSubject(SubjectRequest subjectRequest) {
        Subject subject = new Subject();
        BeanUtils.copyProperties(subjectRequest, subject);
        final int count = subjectMapper.updateById(subject);
        return count > 0;
    }

    @Override
    public Boolean addSubject(SubjectRequest subjectRequest) {
        Subject subject = new Subject();
        BeanUtils.copyProperties(subjectRequest, subject);
        subject.setUid(UUidUtils.getUUId());
        final Date date = new Date();
        subject.setCreateTime(date);
        subject.setUpdateTime(date);
        subject.setStatus(1);
        subject.setClickCount(0);
        final int count = subjectMapper.insert(subject);
        return count > 0;
    }

    @Override
    public Boolean deleteBatch(List<String> uids) {
        final int count = subjectMapper.deleteBatch(uids);
        return count > 0;
    }
}
