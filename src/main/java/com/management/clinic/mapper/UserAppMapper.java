package com.management.clinic.mapper;

import com.management.clinic.entity.UserApp;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserAppMapper implements RowMapper<UserApp> {
    @Override
    public UserApp mapRow(ResultSet rs) {
        UserApp userApp = new UserApp();
        try {
            userApp.setId(rs.getLong("user_id"));
            userApp.setFullName(rs.getString("full_name"));
            userApp.setEmail(rs.getString("email"));
            userApp.setMobile(rs.getString("mobile"));
            userApp.setUsername(rs.getString("user_name"));
            userApp.setPassword(rs.getString("password"));
            return userApp;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
