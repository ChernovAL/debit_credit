package com.in6k.account;

public class Transaction {
    protected int id;
    protected double debit_account;
    protected double credit_account;
    protected double sum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getDebit_account() {
        return debit_account;
    }

    public void setDebit_account(double debit_account) {
        this.debit_account = debit_account;
    }

    public double getCredit_account() {
        return credit_account;
    }

    public void setCredit_account(double credit_account) {
        this.credit_account = credit_account;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }
}
