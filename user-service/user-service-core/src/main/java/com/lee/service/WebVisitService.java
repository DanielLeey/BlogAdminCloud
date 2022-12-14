package com.lee.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lee.common.bo.VisitByWeekBO;
import com.lee.common.entity.WebVisit;

/**
 * @Author: liyansong
 * @Date: 2022/12/13 14:36
 * @Version: 1.0
 */
public interface WebVisitService extends IService<WebVisit> {
    /**
     * 获取近七天的访问量
     *
     * @return {
     * date: ["2019-6-20","2019-6-21","2019-6-22","2019-6-23","2019-6-24",,"2019-6-25","2019-6-26"]
     * pv: [10,5,6,7,5,3,2]
     * uv: [5,3,4,4,5,2,1]
     * }
     * 注：PV表示访问量   UV表示独立用户数
     */
    VisitByWeekBO getVisitByWeek();
}
