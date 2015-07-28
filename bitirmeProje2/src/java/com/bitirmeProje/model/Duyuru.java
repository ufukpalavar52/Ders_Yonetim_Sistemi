package com.bitirmeProje.model;

public class Duyuru {
    private int duyuruId;
    private String duyuruKonuBaslik;
    private String duyuruMesaj;
    
    public Duyuru(){
        ;
    }
    public Duyuru(int duyuruId){
        this.duyuruId = duyuruId;
    }
    
    public Duyuru(int duyuruId,String duyuruKonuBaslik){
        this.duyuruId = duyuruId;
        this.duyuruKonuBaslik = duyuruKonuBaslik;
    }
    
    public Duyuru(int duyuruId,String duyuruKonuBaslik,String duyuruMesaj){
        this.duyuruId = duyuruId;
        this.duyuruKonuBaslik = duyuruKonuBaslik;
        this.duyuruMesaj = duyuruMesaj;
    }
    
    
    public int getDuyuruId(){
        return this.duyuruId;
    }
    
    public String getDuyuruKonuBaslik(){
        return this.duyuruKonuBaslik;
    }
    
    public String getDuyuruMesaj(){
        return this.duyuruMesaj;
    }
    
    public void setDuyuruId(int duyuruId){
        this.duyuruId = duyuruId;
    }
    
    public void setDuyuruKonuBaslik(String duyuruKonuBaslik){
        this.duyuruKonuBaslik = duyuruKonuBaslik;
    }
    
    public void setDuyuruMesaj(String duyuruMesaj){
        this.duyuruMesaj = duyuruMesaj;
    }
    
}
