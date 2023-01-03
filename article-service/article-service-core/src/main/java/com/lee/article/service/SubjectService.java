package com.lee.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.Request.BaseRequest;
import com.lee.common.Request.SubjectRequest;
import com.lee.common.bo.SubjectBO;
import com.lee.common.entity.Subject;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 9:59
 * @Version: 1.0
 */
public interface SubjectService extends IService<Subject> {

    List<SubjectBO> getList(BaseRequest baseRequest);

    Boolean editSubject(SubjectRequest subjectRequest);

    Boolean addSubject(SubjectRequest subjectRequest);

    Boolean deleteBatch(List<String> uids);
}
