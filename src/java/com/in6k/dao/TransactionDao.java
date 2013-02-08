package com.in6k.dao;

import com.in6k.entity.Trans;
import com.in6k.entity.User;
import com.in6k.hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


import javax.swing.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDao {

    public static List getAll() throws SQLException {
        Session session = null;
        List  list = new ArrayList();
        try {
            session = HibernateUtil.getInstance().openSession();
            list = session.createCriteria(Trans.class).list();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return list;
    }



    public static void save(Trans trans) {
        Transaction tx = null;
        Session session = HibernateUtil.getInstance().openSession();
        tx = session.beginTransaction();
        session.save(trans);
        tx.commit();
    }
}
