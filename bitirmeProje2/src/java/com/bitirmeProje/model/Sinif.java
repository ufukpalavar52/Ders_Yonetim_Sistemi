package com.bitirmeProje.model;

public class Sinif {

    private int sinifId ,kapasite, labMi;
    private String sinifAd;

    public Sinif() {
        ;
    }
    
    public Sinif(int sinifId){
        this.sinifId = sinifId;
    }
    
    public Sinif(int sinifId,String sinifAd) {
        this.sinifId = sinifId;
        this.sinifAd = sinifAd;
    }

    public int getSinifId() {
        return this.sinifId;
    }

    public String getSinifAd() {
        return this.sinifAd;
    }

    public void setSinifId(int sinifId) {
        this.sinifId = sinifId;
    }
    public void setKapasite(int kapasite) {
        this.kapasite = kapasite;
    }
    public void setLabMi(int labMi) {
        this.labMi = labMi;
    }
    
    public int getLabMi() {
        return this.labMi;
    }
    
    public int getKapasite(){
        return this.kapasite;
    } 

    public void setSinifAd(String sinifAd) {
        this.sinifAd = sinifAd;
    }
}
