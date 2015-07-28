package com.bitirmeProje.model;

import java.io.Serializable;


public class Ders implements Serializable {
   
	
    private static final long serialVersionUID = 1L;
    private String dersId,dersAd,tablo;
    private int dersKredi,pratikDersSaati,teorikDersSaati,labDersSaati, dersYil;
    
    public Ders(){
        ;
    }
    public Ders(String dersId){
        this.dersId = dersId;
    }
    
    public Ders(String dersId,String dersAd){        
        this.dersId = dersId;
        this.dersAd = dersAd;
    }
    
    public Ders(String dersId,String dersAd,int derskredi){        
        this.dersId = dersId;
        this.dersAd = dersAd;
        this.dersKredi = derskredi;
    }
    
    public Ders(String dersId,String dersAd,int derskredi,int pratikDersSaati){        
        this.dersId = dersId;
        this.dersAd = dersAd;
        this.dersKredi = derskredi;
        this.pratikDersSaati = pratikDersSaati;
    }
    
     public Ders(String dersId,String dersAd,int derskredi,int pratikDersSaati,int teorikDersSaati){        
        this.dersId = dersId;
        this.dersAd = dersAd;
        this.dersKredi = derskredi;
        this.pratikDersSaati = pratikDersSaati;
        this.teorikDersSaati = teorikDersSaati;
    }
    
     
     public Ders(String dersId,String dersAd,int derskredi,int pratikDersSaati,int teorikDersSaati,int labDersSaati){        
        this.dersId = dersId;
        this.dersAd = dersAd;
        this.dersKredi = derskredi;
        this.pratikDersSaati = pratikDersSaati;
        this.teorikDersSaati = teorikDersSaati;
        this.labDersSaati = labDersSaati;
    }
    
    
     
    public void setTablo(String tablo) {
        this.tablo = tablo;
    }
    public String getTablo() {
        return this.tablo;
    } 
    
    public String getDersId(){
        return this.dersId;
    }
    
    public String getDersAd(){
        return this.dersAd;
    }
    
    public int getDersKredi(){
        return this.dersKredi;
    }
    
    public int getPratikDersSaati(){
        return this.pratikDersSaati;
    }
    
    public int getTeorikDersSaati(){
        return this.teorikDersSaati;
    }
    
    public int getLabDersSaati(){
        return this.labDersSaati;
    }
    
    public int getDersYil(){
    	return this.dersYil;
    }
    
    public void setDersYil(int dersYil){
    	 this.dersYil = dersYil;
    }
    
    public void setDersId(String dersId){
        this.dersId = dersId;
    }
    
    public void setDersAd(String dersAd){
        this.dersAd = dersAd;
    }
    
    public void setDersKredi(int dersKredi){
        this.dersKredi = dersKredi;
    }
    
    public void setPratikDersSaati(int pratikDersSaati){
        this.pratikDersSaati = pratikDersSaati;
    }
    
    public void setTeorikDersSaati(int teorikDersSaati){
        this.teorikDersSaati = teorikDersSaati;
    }
    
    public void setLabDersSaati(int labDersSaati){
        this.labDersSaati = labDersSaati;
    }
    
    
}
