package com.bitirmeProje.model;

public class Dosya {
    private int dosyaId;
    private String dosyaAd,dosyaYolu,ders_dersId;
    
    public Dosya(){
    ;    
    }
    
    public Dosya(int dosyaId){
        this.dosyaId = dosyaId;
    }
    
    public Dosya(int dosyaId,String dosyaAd){
        this.dosyaId = dosyaId;
        this.dosyaAd = dosyaAd;
    }
    
    public Dosya(int dosyaId,String dosyaAd,String dosyaYolu){
        this.dosyaId = dosyaId;
        this.dosyaAd = dosyaAd;
        this.dosyaYolu = dosyaYolu;
    }
    
    public Dosya(int dosyaId,String dosyaAd,String dosyaYolu,String ders_dersId){
        this.dosyaId = dosyaId;
        this.dosyaAd = dosyaAd;
        this.dosyaYolu = dosyaYolu;
        this.ders_dersId = ders_dersId;
    }
    
    public int getDosyaId(){
        return this.dosyaId;
    }
    
    public String getDosyaAd(){
        return this.dosyaAd;
    }
    
    public String getDosyaYolu(){
        return this.dosyaYolu;
    }
    
    public String getDersId(){
        return this.ders_dersId;
    }
    
     public void setDosyaId(int dosyaId){
        this.dosyaId = dosyaId;
    }
    
    public void setDosyaAd(String dosyaAd){
       this.dosyaAd = dosyaAd;
    }
    
    public void setDosyaYolu(String dosyaYolu){
        this.dosyaYolu = dosyaYolu;
    }
    
    public void setDersId(String ders_dersId ){
        this.ders_dersId = ders_dersId;
    }
    
    
    
}
