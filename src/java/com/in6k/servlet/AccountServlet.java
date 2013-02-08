package com.in6k.servlet;

import com.in6k.dao.AccountDao;
import com.in6k.dao.UserDao;
import com.in6k.entity.Account;
import com.in6k.entity.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AccountServlet extends HttpServlet {
    private final Log logger = LogFactory.getLog(getClass());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> accountList = null;
        List usersList = null;
        try {
            accountList = AccountDao.getAll();
            usersList = UserDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("usersList", usersList);
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("accounts.jsp").include(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List accountList = null;
        List usersList = null;

        User user = null;
        Account account = new Account();

        try {
            user = UserDao.getTransactionById(Integer.parseInt(request.getParameter("user_id")));
            usersList = UserDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        account.setName(request.getParameter("account_name"));
        account.setCash(Double.parseDouble(request.getParameter("cash")));
        account.setUser(user);

        AccountDao.save(account);

        try {
            accountList = AccountDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("usersList", usersList);
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("accounts.jsp").include(request,response);
    }
}
