package com.management.clinic.dao;

import com.management.clinic.entity.RoleApp;
import com.management.clinic.entity.UserApp;

import java.util.List;

public interface UserDAO {

    UserApp findByUsername(String username);

    void update(UserApp userApp);

    UserApp findById(Long id);

    void changePassword(Long id, String password);
}
