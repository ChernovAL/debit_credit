package com.in6k.entity;


import java.util.ArrayList;
import java.util.List;

public class User {
    public int id;
    public String name;
    public int type;

    private static final String VALID_NAME = "[a-zA-Z]{2,}";

    private List validateErrors = new ArrayList();

    public User() {
    }

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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
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
