package com.lee.article.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lee.common.entity.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: liyansong
 * @Date: 2022/12/24 15:36
 * @Version: 1.0
 */
public interface BlogMapper extends BaseMapper<Blog> {

    int deleteBatch(@Param("uids") List<String> uids);

    List<Blog> getSameBlogByBlogUid(@Param("blogUid") String blogUid);

    List<String> getSortList();

    List<Blog> getArticleByMonth(@Param("begDate") String begDate,@Param("endDate") String endDate);
}
