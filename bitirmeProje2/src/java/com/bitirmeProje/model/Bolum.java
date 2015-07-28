
package com.bitirmeProje.model;


public class Bolum {
    private int bolumId;
    private String bolumAd;
    
    public Bolum(){
    ;
    }
    
    public Bolum(int bolumId){
        this.bolumId = bolumId;
    }
    
     public Bolum(int bolumId,String bolumAd){
        this.bolumId = bolumId;
        this.bolumAd = bolumAd;
    }
    
    
    public void setBolumId(int bolumId){
        this.bolumId = bolumId;
    }
    
    public void setBolumAd(String bolumAd){
        this.bolumAd = bolumAd;
    }
    
    public int getBolumId(){
        
        return this.bolumId;
    }
    
    public String getBolumAd(){
        
        return this.bolumAd;
    }
    
}
