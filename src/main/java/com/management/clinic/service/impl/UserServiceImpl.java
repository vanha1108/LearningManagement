package com.management.clinic.service.impl;

import com.management.clinic.dao.UserDAO;
import com.management.clinic.entity.UserApp;
import com.management.clinic.service.UserService;
import javassist.NotFoundException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

public class UserServiceImpl implements UserService {

    @Inject
    private UserDAO userDAO;

    @Override
    public UserApp changePassword(Long userId, String oldPassword, String newPassword) throws NotFoundException {
        UserApp userApp = userDAO.findById(userId);
        if (userApp == null) {
            throw new NotFoundException("User not found");
        }
        if (!userApp.getPassword().equals(oldPassword)) {
            throw new IllegalArgumentException("Old password incorrect");
        }
        userDAO.changePassword(userApp.getId(), newPassword);
        return this.findById(userId);
    }

    @Override
    public UserApp updateInfo(UserApp userApp) {
        userDAO.update(userApp);
        return userDAO.findById(userApp.getId());
    }

    @Override
    public UserApp getUserInfoFromRequest(HttpServletRequest req, UserApp userApp) throws Exception {
        String mobile = req.getParameter("txtPhone");
        String fullName = req.getParameter("fullName");
        String username = req.getParameter("username");

        userApp.setUsername(username);
        userApp.setFullName(fullName);
        userApp.setMobile(mobile);

        return userApp;
    }

    @Override
    public UserApp findById(Long userId) {
        return userDAO.findById(userId);
    }

    @Override
    public UserApp findByUserName(String userName) {
        return userDAO.findByUsername(userName);
    }
}
