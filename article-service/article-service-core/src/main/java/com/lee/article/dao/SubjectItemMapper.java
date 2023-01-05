package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.SubjectItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/30 16:32
 * @Version: 1.0
 */
public interface SubjectItemMapper extends BaseMapper<SubjectItem> {

    int deleteBatch(@Param("uids") List<String> uids);
}
