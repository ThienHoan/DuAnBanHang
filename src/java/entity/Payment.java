package java.entity;

import java.util.Date;

public class Payment {
    private int paymentId;
    private int orderId;
    private double amount;
    private String paymentMethod;
    private String transactionCode;
    private String status;
    private Date paymentDate;
    private String note;
    
    // Constructor, getters và setters
    public Payment() {
    }
    
    public Payment(int paymentId, int orderId, double amount, String paymentMethod, String transactionCode, 
                  String status, Date paymentDate, String note) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.transactionCode = transactionCode;
        this.status = status;
        this.paymentDate = paymentDate;
        this.note = note;
    }
    
    // Getters và setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(String transactionCode) {
        this.transactionCode = transactionCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}