package com.management.clinic.dao.impl;

import com.management.clinic.dao.UserDAO;
import com.management.clinic.entity.UserApp;
import com.management.clinic.mapper.UserAppMapper;
import org.apache.commons.collections.CollectionUtils;

import java.util.List;

public class UserDAOImpl extends AbstractDAO<UserApp> implements UserDAO {

    @Override
    public UserApp findByUsername(String username) {
        String sql = "SELECT * FROM user WHERE user_name =?";
        List<UserApp> userApps = query(sql, new UserAppMapper(), username);
        return CollectionUtils.isEmpty(userApps) ? null : userApps.get(0);
    }

    @Override
    public void update(UserApp userApp) {
        String sql = "UPDATE user SET full_name=?, mobile=?, user_name=? WHERE user_id =?";
        update(sql, userApp.getFullName(), userApp.getMobile(), userApp.getUsername(), userApp.getId());
    }

    @Override
    public UserApp findById(Long id) {
        String sql = "SELECT * FROM user WHERE user_id= ?";
        List<UserApp> userApps = query(sql, new UserAppMapper(), id);
        return CollectionUtils.isEmpty(userApps) ? null : userApps.get(0);
    }

    @Override
    public void changePassword(Long id, String password) {
        String sql = "UPDATE user SET password = ? WHERE user_id =?";
        update(sql, password, id);
    }

    public List<UserApp> getAllUserMember() {
        String sql = "SELECT * FROM user u JOIN role r ON u.role_id=r.id and r.name != 'ADMIN'";
        return query(sql, new UserAppMapper());
    }
}
