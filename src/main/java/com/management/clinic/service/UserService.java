package com.management.clinic.service;

import com.management.clinic.entity.UserApp;
import javassist.NotFoundException;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    UserApp changePassword(Long userId, String oldPassword, String newPassword) throws NotFoundException;

    UserApp updateInfo(UserApp userApp);

    UserApp getUserInfoFromRequest(HttpServletRequest req, UserApp userApp) throws Exception;

    UserApp findById(Long userId);

    UserApp findByUserName(String userName);
}
