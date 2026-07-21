package mypack.models;

import java.io.Serializable;

public class BookingForm implements Serializable {
    private int showId;
    private String showTitle;
    private double basePrice;
    private String customerName;
    private String email;
    private int quantity = 1;

    public BookingForm() {}

    public double getDiscountPercentage() {
        return quantity >= 5 ? 0.25 : 0.0;
    }

    public double getTotalPrice() {
        return (basePrice * quantity) * (1 - getDiscountPercentage());
    }

    public int getShowId() { return showId; }
    public void setShowId(int showId) { this.showId = showId; }

    public String getShowTitle() { return showTitle; }
    public void setShowTitle(String showTitle) { this.showTitle = showTitle; }

    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}