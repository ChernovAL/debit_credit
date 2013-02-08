package com.in6k.dao;

import com.in6k.entity.Account;
import com.in6k.entity.User;
import com.in6k.hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.swing.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {

    public static void save(Account account) {
        Transaction tx = null;
        Session session = HibernateUtil.getInstance().openSession();
        tx = session.beginTransaction();
        session.saveOrUpdate(account);
        tx.commit();
    }

    public static List getAll() throws SQLException {
        Session session = null;
        List  list = new ArrayList();
        try {
            session = HibernateUtil.getInstance().openSession();
            list = session.createCriteria(Account.class).list();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return list;
    }

    public static Account getAccountById(int id) throws SQLException {
        Session session = null;
        Account account = null;
        try {
            session = HibernateUtil.getInstance().openSession();
            account = (Account) session.load(Account.class, id);
        } catch (Exception e) {
            e.getMessage();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return account;
    }

    public static void findSumDebetandCredit(Account user) {
        double debet=0;
        double credit=0;
        double sum=0;
        Object tempDebetAndCredit;
        Session session = HibernateUtil.getInstance().openSession();
        tempDebetAndCredit = session.createSQLQuery("SELECT SUM(account.transactions.sum) FROM account.transactions where account.transactions.debit_account="+user.getId()+"").list().get(0);

        if (tempDebetAndCredit !=  null){
            debet = new Double(tempDebetAndCredit.toString());
        }

        tempDebetAndCredit = session.createSQLQuery("SELECT SUM(account.transactions.sum) FROM account.transactions where account.transactions.credit_account="+user.getId()+"").list().get(0);
        if (tempDebetAndCredit != null){
            credit = new Double(tempDebetAndCredit.toString());
        }

        session.close();
        sum = debet - credit;
        user.setCash(sum);

    }
}
