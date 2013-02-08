package com.in6k.servlet;

import com.in6k.dao.AccountDao;
import com.in6k.dao.TransactionDao;
import com.in6k.entity.Account;
import com.in6k.entity.Trans;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class TransactionServlet extends HttpServlet {
    private final Log logger = LogFactory.getLog(getClass());

    protected  List<Account> accountList = null;
    protected  List transList = null;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            accountList = AccountDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            transList = TransactionDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("transList",transList);

        request.setAttribute("accountList", accountList);

        request.getRequestDispatcher("transactions.jsp").include(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account debitAccount = new Account();
        Account creditAccount = new Account();

        Trans transaction = new Trans();

        try {
            debitAccount = AccountDao.getAccountById(Integer.parseInt(request.getParameter("debit_id")));
            creditAccount = AccountDao.getAccountById(Integer.parseInt(request.getParameter("credit_id")));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        transaction.setDebitAccount(debitAccount);
        transaction.setCreditAccount(creditAccount);
        transaction.setSum(Double.parseDouble(request.getParameter("sum_value")));

        TransactionDao.save(transaction);


        try {
            accountList = AccountDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            transList = TransactionDao.getAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        int i = 0;
        for(Account item: accountList){
            AccountDao.findSumDebetandCredit(accountList.get(i));
            i++;
        }

        request.setAttribute("transList",transList);

        request.setAttribute("accountList", accountList);

        request.getRequestDispatcher("transactions.jsp").include(request,response);
    }
}
