package com.lee.common.message;

import org.springframework.context.ApplicationEvent;

/**
 * @Author: liyansong
 * @Date: 2023/1/31 21:19
 * @Version: 1.0
 */
public class PlacePayEvent extends ApplicationEvent {

    private static final long serialVersionUID = 7374023574650899118L;

    public PlacePayEvent(PlacePayEventMessage source) {
        super(source);
    }
}
