//接口
package com.service;
import com.pj.User;
public interface UserService {

    User login(User  user);

    void register(User user);

    void delete(User user);
}
