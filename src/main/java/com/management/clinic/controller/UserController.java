package com.management.clinic.controller;

import com.management.clinic.constant.SessionConstant;
import com.management.clinic.entity.UserApp;
import com.management.clinic.service.UserService;
import com.management.clinic.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(urlPatterns = {"/user/profile", "/user/password" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserController extends HttpServlet {

    @Inject
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MessageUtil.showMessage(req);
        UserApp userApp = new UserApp();
        userApp.setId(1L);
        userApp.setFullName("Nguyen Van A");
        userApp.setUsername("username");
        userApp.setPassword("123456");
        userApp.setMobile("0336522222");
        userApp.setEmail("nguyenvana@yopmail.com");
        HttpSession session = req.getSession();
        session.setAttribute("USER_APP", userApp);
        switch (req.getServletPath()) {
            case "/user/profile":
                req.getRequestDispatcher("/views/user/profile.jsp").forward(req, resp);
                break;
            case "/user/password":
                req.getRequestDispatcher("/views/user/password.jsp").forward(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "/error/500";
        switch (req.getServletPath()) {
            case "/user/profile": {
                try {
                    HttpSession session = req.getSession();
                    UserApp userApp = (UserApp) session.getAttribute(SessionConstant.USER_APP);
                    userApp = userService.getUserInfoFromRequest(req, userApp);
                    UserApp checkUserName = userService.findByUserName(userApp.getUsername());
                    if (checkUserName != null) {
                        url = "/user/profile?message=" + "USERNAME_EXISTED";
                    } else {
                        userApp = userService.updateInfo(userApp);
                        if (userApp != null) {
                            session.setAttribute(SessionConstant.USER_APP, userApp);
                            url = "/user/profile?message=" + "UPDATE_PROFILE_SUCCESS";
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            }
            case "/user/password":
                try {
                    String oldPass = req.getParameter("oldPass");
                    String newPass = req.getParameter("newPass");
                    HttpSession session = req.getSession();
                    UserApp userApp = (UserApp) session.getAttribute(SessionConstant.USER_APP);

                    userApp = userService.changePassword(userApp.getId(), oldPass, newPass);
                    if (userApp != null) {
                        session.setAttribute(SessionConstant.USER_APP, userApp);
                        url = "/user/password?message=" + "CHANGE_PASSWORD_SUCCESS";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
        resp.sendRedirect(req.getContextPath() + url);
    }
}
