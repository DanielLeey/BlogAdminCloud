package com.lee.common.ThreadHolder;

import com.lee.common.entity.User;

/**
 * 存放当前线程的操作用户
 */
public class UserThreadHolder {

    private static ThreadLocal<User> userThreadLocal = new ThreadLocal<>();

    public static void set(User user) {
        userThreadLocal.set(user);
    }

    public static User get() {
        return userThreadLocal.get();
    }

    public static void remove() {
        userThreadLocal.remove();
    }
}
