package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 10:02
 * @Version: 1.0
 */
public interface SubjectMapper extends BaseMapper<Subject> {
    int deleteBatch(@Param("uids") List<String> uids);
}
