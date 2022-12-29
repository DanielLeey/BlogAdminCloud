package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/21 11:08
 * @Version: 1.0
 */
public interface TagMapper extends BaseMapper<Tag> {

    int stick(@Param("uid") String uid);

    int deleteBatch(@Param("uids") List<String> uids);

    int updateSortByClickCount();
}
