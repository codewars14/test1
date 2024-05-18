//实现
package com.service.lmpl;
import com.service.UserService;
import org.springframework.stereotype.Service;
import com.dao.UserMapper;
import com.pj.User;
import javax.annotation.Resource;
@Service
public class UserServicelmpl implements UserService{
    @Resource
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public void register(User user) {
         userMapper.register(user);
    }

    @Override
    public void delete(User user) {
        userMapper.delete(user);
    }
}
