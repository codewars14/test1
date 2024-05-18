package com.dao;

import com.pj.User;

public interface UserMapper {
    User login(User  user);

    void register(User user);

    void delete(User user);
}
