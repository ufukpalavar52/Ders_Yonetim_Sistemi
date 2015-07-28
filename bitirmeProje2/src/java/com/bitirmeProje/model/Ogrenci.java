
package com.bitirmeProje.model;


public class Ogrenci {
    private String ogrenciNo,ogrenciAd,ogrenciSoyad,ogrenciSifre,ogrenciEposta,ogrenciCepTel;
    private int bolum_bolumId;
    
    public Ogrenci(){
        ;
    }
    
    public Ogrenci(String ogrenciNo){
        this.ogrenciNo = ogrenciNo;
    }
    
    
    public Ogrenci(String ogrenciNo,String ogrenciAd){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
    }
    
    public Ogrenci(String ogrenciNo,String ogrenciAd,String ogrenciSoyad){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
        this.ogrenciSoyad = ogrenciSoyad;
    }
    
    public Ogrenci(String ogrenciNo,String ogrenciAd,String ogrenciSoyad,String ogrenciSifre){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
        this.ogrenciSoyad = ogrenciSoyad;
        this.ogrenciSifre = ogrenciSifre;
    }
    public Ogrenci(String ogrenciNo,String ogrenciAd,String ogrenciSoyad,String ogrenciSifre,String ogrenciEposta){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
        this.ogrenciSoyad = ogrenciSoyad;
        this.ogrenciSifre = ogrenciSifre;
        this.ogrenciEposta = ogrenciEposta;
        
    }
    
    public Ogrenci(String ogrenciNo,String ogrenciAd,String ogrenciSoyad,String ogrenciSifre,String ogrenciEposta,String ogrenciCepTel){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
        this.ogrenciSoyad = ogrenciSoyad;
        this.ogrenciSifre = ogrenciSifre;
        this.ogrenciEposta = ogrenciEposta;
        this.ogrenciCepTel = ogrenciCepTel;
        
    }
    
     public Ogrenci(String ogrenciNo,String ogrenciAd,String ogrenciSoyad,String ogrenciSifre,String ogrenciEposta,String ogrenciCepTel,int bolum_bolumId){
        this.ogrenciNo = ogrenciNo;
        this.ogrenciAd = ogrenciAd;
        this.ogrenciSoyad = ogrenciSoyad;
        this.ogrenciSifre = ogrenciSifre;
        this.ogrenciEposta = ogrenciEposta;
        this.ogrenciCepTel = ogrenciCepTel;
        this.bolum_bolumId = bolum_bolumId;
        
    }
    
    
    
    public String getOgrenciNo(){
        return this.ogrenciNo;
    }
    
    public String getOgrenciAd(){
        return this.ogrenciAd;
    }
    
    public String getOgrenciSoyad(){
        return this.ogrenciSoyad;
    }
    
    public String getOgrenciSifre(){
        return this.ogrenciSifre;
    }
    
    public String getOgrenciEposta(){
        return this.ogrenciEposta;
    }
    
    public String getOgrenciCepTel(){
        return this.ogrenciCepTel;
    }
    
    public int getBolum_BolumId(){
        return this.bolum_bolumId;
    }
    
    public void setOgrenciNo(String ogrenciNo){
        this.ogrenciNo = ogrenciNo;
    }
    
    public void setOgrenciAd(String ogrenciAd){
        this.ogrenciAd = ogrenciAd;
    }
    
    public void setOgrenciSoyad(String ogrenciSoyad){
        this.ogrenciSoyad= ogrenciSoyad;
    }
    
    public void setOgrenciSifre(String ogrenciSifre){
        this.ogrenciSifre = ogrenciSifre;
    }
    
     public void setOgrenciEposta(String ogrenciEposta){
         this.ogrenciEposta = ogrenciEposta;
    }
    
    public void setOgrenciCepTel(String ogrenciCepTel){
        this.ogrenciCepTel = ogrenciCepTel ;
    }
    
    public void setBolum_BolumId(int bolum_bolumId){
        this.bolum_bolumId = bolum_bolumId;
    }
    
}
