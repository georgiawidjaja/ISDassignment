/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.beans;

import java.time.LocalDate;

/**
 *
 * @author kyler
 */
public class Payment {

    private String paymentID;
    private String paymentCardName;
    private long paymentCardNumber;
    private int paymentCardCVC;
    private LocalDate paymentCardExpiryDate;

    public Payment(String paymentID, String paymentCardName, long paymentCardNumber, int paymentCardCVC, LocalDate paymentCardExpirtyDate) {
        this.paymentID = paymentID;
        this.paymentCardName = paymentCardName;
        this.paymentCardNumber = paymentCardNumber;
        this.paymentCardCVC = paymentCardCVC;
        this.paymentCardExpiryDate = paymentCardExpiryDate;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentCardName() {
        return paymentCardName;
    }

    public void setPaymentCardName(String paymentCardName) {
        this.paymentCardName = paymentCardName;
    }

    public long getPaymentCardNumber() {
        return paymentCardNumber;
    }

    public void setPaymentCardNumber(long paymentCardNumber) {
        this.paymentCardNumber = paymentCardNumber;
    }

    public long getPaymentCardCVC() {
        return paymentCardCVC;
    }

    public void setPaymentCardCVC(int paymentCardCVC) {
        this.paymentCardCVC = paymentCardCVC;
    }

    public LocalDate getPaymentCardExpiryDate() {
        return paymentCardExpiryDate;
    }

    public void setPaymentCardExpiryDate(LocalDate paymentCardExpiryDate) {
        this.paymentCardExpiryDate = paymentCardExpiryDate;
    }
}
