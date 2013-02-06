package com.in6k.user;

import com.in6k.hibernate.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class User {
    public int id;
    public String name;
    public int userId;

    private static final String VALID_NAME = "[a-zA-Z]{2,}";

    private List validateErrors = new ArrayList();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void save() {
        Transaction tx = null;
        Session session = HibernateUtil.getInstance().openSession();
        tx = session.beginTransaction();
        session.save(this);
        tx.commit();
    }

    public List validate() {
        String error;

        if(!isNameValidate()) {
            error = "Name is not valid.";
            validateErrors.add(error);
        }

        return this.validateErrors;
    }

    private boolean isNameValidate() {
        return this.name.matches(VALID_NAME);
    }

}
