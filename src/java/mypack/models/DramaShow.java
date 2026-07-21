package mypack.models;

import java.io.Serializable;

public class DramaShow implements Serializable {
    private int id;
    private String titleEn;
    private String titleVi;
    private String venue;
    private double pricePerTicket;
    private String showTime;

    public DramaShow() {}

    public DramaShow(int id, String titleEn, String titleVi, String venue, double pricePerTicket, String showTime) {
        this.id = id;
        this.titleEn = titleEn;
        this.titleVi = titleVi;
        this.venue = venue;
        this.pricePerTicket = pricePerTicket;
        this.showTime = showTime;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitleEn() { return titleEn; }
    public void setTitleEn(String titleEn) { this.titleEn = titleEn; }

    public String getTitleVi() { return titleVi; }
    public void setTitleVi(String titleVi) { this.titleVi = titleVi; }

    public String getVenue() { return venue; }
    public void setVenue(String venue) { this.venue = venue; }

    public double getPricePerTicket() { return pricePerTicket; }
    public void setPricePerTicket(double pricePerTicket) { this.pricePerTicket = pricePerTicket; }

    public String getShowTime() { return showTime; }
    public void setShowTime(String showTime) { this.showTime = showTime; }
}