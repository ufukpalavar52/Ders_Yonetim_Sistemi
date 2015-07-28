
package com.bitirmeProje.model;


public class Akademisyen {
    
    
    private String akademisyenNo, akademisyenAd,akademisyenSoyad,akademisyenSifre,akademisyenEposta;
    private String akademisyenIsTel,akademisyenCepTel, akademisyenBolumAd,bolumAd, bolumBaskani,akademisyenBolumId; 
    private int bolumId, cevap,yetki,donemId;
    
    
    public Akademisyen(){
        ;
    }
    
    
    public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
    }
    
    public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad,String akademisyenSifre){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
        this.akademisyenSifre = akademisyenSifre;
        
    }
    
    public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad,String akademisyenSifre,String akademisyenEposta){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
        this.akademisyenSifre = akademisyenSifre;
        this.akademisyenEposta = akademisyenEposta;
        
    }
    
     public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad,String akademisyenSifre,String akademisyenEposta,String akademisyenIsTel){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
        this.akademisyenSifre = akademisyenSifre;
        this.akademisyenEposta = akademisyenEposta;
        this.akademisyenIsTel = akademisyenIsTel;
        
    }
     
     public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad,String akademisyenSifre,String akademisyenEposta,String akademisyenIsTel,String akademisyenCepTel){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
        this.akademisyenSifre = akademisyenSifre;
        this.akademisyenEposta = akademisyenEposta;
        this.akademisyenIsTel = akademisyenIsTel;
        this.akademisyenCepTel = akademisyenCepTel;
        
    }
     
     public Akademisyen(String akademisyenNo,String akademisyenAd,String akademisyenSoyad,String akademisyenSifre,String akademisyenEposta,String akademisyenIsTel,String akademisyenCepTel,int bolum_bolumId){
        this.akademisyenNo = akademisyenNo;
        this.akademisyenAd = akademisyenAd;
        this.akademisyenSoyad = akademisyenSoyad;
        this.akademisyenSifre = akademisyenSifre;
        this.akademisyenEposta = akademisyenEposta;
        this.akademisyenIsTel = akademisyenIsTel;
        this.akademisyenCepTel = akademisyenCepTel;
        this.bolumId = bolum_bolumId;
        
    }
    public void setAkademisyenDonemId(int donemId) {
        this.donemId = donemId;
    }
    
    public int getAkademisyenDonemId() {
        return this.donemId;
    }
     
    public void setAkademisyenBolumId(String akademisyenBolumId){
    	this.akademisyenBolumId = akademisyenBolumId;
    }
    
    public void setAkademisyenYetki(int yetki){
    	this.yetki = yetki;
    }
    public int getAkademisyenYetki(){
    	return this.yetki;
    }
    
    public String getAkademisyenBolumId(){
    	return this.akademisyenBolumId;
    }
    
    
    public int getBolumId(){
    	return this.bolumId;
    }
    
   
    public String getAkademisyenNo(){
       return this.akademisyenNo;
    }
    
    public String getAkademisyenAd(){
        return this.akademisyenAd;
    }
    
    public String getAkademisyenSoyad() {
        return this.akademisyenSoyad;
    }
    
    public String getAkademisyenSifre() {
        return this.akademisyenSifre;
    }
    
    public String getAkademisyenEposta(){
        return this.akademisyenEposta;
    }
    
    public String getAkademisyenIsTel(){
        return this.akademisyenIsTel;
    }
    
    public String getAkademisyenCepTel(){
        return this.akademisyenCepTel;
    }
    
    
    
    public String getBolumAd(){
        return this.bolumAd;
    }
    
    public void setAkademisyenNo(String akademisyenNo){
        this.akademisyenNo = akademisyenNo;
    }
    
    public void setAkademisyenAd(String akademisyenAd){
        this.akademisyenAd = akademisyenAd;
    }
    
    public void setAkademisyenSoyad(String akademisyenSoyad){
        this.akademisyenSoyad = akademisyenSoyad;
    }
     public void setAkademisyenEposta(String akademisyenEposta){
        this.akademisyenEposta = akademisyenEposta;
    }
    
    public void setAkademisyenIsTel(String akademisyenIsTel){
         this.akademisyenIsTel = akademisyenIsTel;
    }
    
    public void setAkademisyenCepTel(String akademisyenCepTel){
       this.akademisyenCepTel = akademisyenCepTel;
    }
    
    public void setAkademisyenSifre(String akademisyenSifre){
       this.akademisyenSifre = akademisyenSifre;
    }
    
    
    
    public void setAkademisyenBolumAd(int bolumId){
        this.bolumId = bolumId;
    }
    /**
    public String getAkademisyenBolumAd(){
    	if (this.bolumId == 1)
    		this.akademisyenBolumAd = "Bilgisayar M�hendili�i";
    	if (this.bolumId == 2)
    		this.akademisyenBolumAd = "�evre M�hendili�i";
    	if (this.bolumId == 3)
    		this.akademisyenBolumAd = "Elektrik ve Elektronik M�hendisli�";
    	if (this.bolumId == 4)
    		this.akademisyenBolumAd = "End�stri M�hendisli�i";
    	if (this.bolumId == 5)
    		this.akademisyenBolumAd = "G�da M�hendisli�i";
    	if (this.bolumId == 6)
    		this.akademisyenBolumAd = "Harita M�hendisli�i";
    	if (this.bolumId == 7)
    		this.akademisyenBolumAd = "�n�aat M�hendisli�i";
    	if (this.bolumId == 8)
    		this.akademisyenBolumAd = "Kimya M�hendisli�i";
    	if (this.bolumId == 9)
    		this.akademisyenBolumAd = "Makina M�hendisli�i";
    	if (this.bolumId == 10)
    		this.akademisyenBolumAd = "Malzeme Bilimi M�hendisli�i";
    	
    	
    	return this.akademisyenBolumAd;
    			
    }*/
    
    public void setBolumId(int bolumId)
    {
    	this.bolumId = bolumId;
    }
    
    public void setBolumAd(String bolumAd)
    {
    	this.bolumAd = bolumAd;
    }
    
    public void setBolumBaskani(int cevap)
    {
    	this.cevap = cevap;
    }
    
    public String getBolumBaskani()
    {
    	if(this.cevap == 0)
    		this.bolumBaskani = "Akademisyen";
    	
    	if(this.cevap == 1)
    		this.bolumBaskani = "B�l�m Ba�kan�";
    	
    	if(this.cevap == 2)
    		this.bolumBaskani = "Admin";
    	
    	return this.bolumBaskani;
    	
    }
    
    
    
   
   
}
