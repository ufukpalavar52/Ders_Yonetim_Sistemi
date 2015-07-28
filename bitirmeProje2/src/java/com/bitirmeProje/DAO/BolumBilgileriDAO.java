
package com.bitirmeProje.DAO;

import com.bitirmeProje.model.Bolum;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Locale;


public class BolumBilgileriDAO {
    
    public BolumBilgileriDAO() {
        ;
    }
    ResultSet rs = null;
    Statement st = null;
    
    public int BolumSayisi() throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from bolum where bolumId != 11; ";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return 0;
    }
    public int AkademisyenSayisi() throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from akademisyen where pasifMi = 0; ";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return 0;
    }
    
    public String AktifDonem() throws SQLException {
        String donem = ""; 
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select akademikYil,donemAd from donem where aktifMi = 1; ";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                donem = rs.getString("akademikYil")+"/"+rs.getString("donemAd");
                
            }
            conn.close();
            return donem;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return "";
    }
    
    public int YoneticiSayisi() throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from akademisyan_has_yetki where yetki_yetkiId = 3; ";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return sayi;
    }
    public int OgrenciSayisi() throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from ogrenci";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return sayi;
    }
    public int DersSayisi() throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from ders";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return sayi;
    }
    
    public ArrayList<Bolum> BolumBilgisi()throws SQLException {
        ArrayList<Bolum> bolum = new ArrayList();
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sql = "Select *from bolum;";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            while (rs.next()) {
                Bolum bolumIs = new Bolum();
                bolumIs.setBolumAd(rs.getString("bolumAd"));
                bolumIs.setBolumId(rs.getInt("bolumId"));
                bolum.add(bolumIs);
            }
            conn.close();
            return bolum;
            
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    
    public int BolumDersSayisi(int bolum) throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from ders where bolum_bolumId = '"+bolum+"';";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return sayi;
    }
    
    
    public int BolumOgrtSayisi(int bolum) throws SQLException {
        int sayi = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from akademisyen where bolum_bolumId = '"+bolum+"' and pasifMi = 0;";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
            return sayi;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return sayi;
    }
    
    
    public int DersAtamaOrani(int bolum) throws SQLException {
        int sayi = 0;
        int dersAtaSayi;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select COUNT(*) from akademisyen where bolum_bolumId = '"+bolum+"' and pasifMi = 0;";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            if (rs.next()) {
                sayi = rs.getInt("COUNT(*)");
            }
            conn.close();
               
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        dersAtaSayi = DersAtamaSayisi(bolum);
        
        if (sayi != 0)
            return (dersAtaSayi*100)/sayi;
        else
            return 0;
    }
    
    public int DersAtamaSayisi(int bolum) throws SQLException {
        int x = 0;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select DISTINCT akademisyenNo, akademisyenAd, akademisyenSoyad  from akademisyen, ders, ders_has_akademisyan,donem Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders.bolum_bolumId = '"+bolum+"' and akademisyen.bolum_bolumId = '"+bolum+"' and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            while (rs.next()) {
                x++;
            }
            
            conn.close();
               
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return x;
    }
    
    public int DersProgramiDersSayisi(int bolum) throws SQLException {
        int x = 0;
        int dersPrg = 0; 
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select DISTINCT akademisyenNo, akademisyenAd, akademisyenSoyad, ders_dersId  from akademisyen, ders, ders_has_akademisyan,donem Where akademisyenNo = akademisyan_akademisyenNo and ders_dersId = dersId and ders.bolum_bolumId = '"+bolum+"' and akademisyen.bolum_bolumId = '"+bolum+"' and ders_has_akademisyan.donem_donemId = donemId and aktifMi=1";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            while (rs.next()) {
                x++;
            }
            
            conn.close();
           System.out.println("x: "+ x);
           if(x > 0) {
                dersPrg = DersProgramiSayisi(bolum);
               
                return (dersPrg*100) / x; 
           }
        } catch (Exception ex) {
            System.out.println(ex);
        }
            
            
            
                return 0;
            
    }
    public int DersProgramiSayisi(int bolum) throws SQLException {
        int x = 0;
        
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select DISTINCT dersprogrami.akademisyenNo , dersprogrami.ders_dersId from dersprogrami,akademisyen,ders_has_akademisyan,ders,donem "
                    + "where akademisyen.akademisyenNo = ders_has_akademisyan.akademisyan_akademisyenNo and akademisyen.bolum_bolumId = '"+bolum+"' and ders_has_akademisyan.akademisyan_akademisyenNo = dersprogrami.akademisyenNo "
                    + "and dersId = ders_has_akademisyan.ders_dersId and ders_has_akademisyan.ders_dersId = dersprogrami.ders_dersId and ders.bolum_bolumId = '"+bolum+"' "
                    + "and ders_has_akademisyan.donem_donemId = donemId and ders_has_akademisyan.donem_donemId = dersprogrami.donem_donemId "
                    + "and aktifMi=1";
            st = conn.createStatement();
            rs = st.executeQuery(sorgu);
            
            while (rs.next()) {
                x++;
            }
            
            System.out.println("dersPrg: "+ x);
            conn.close();
            return x;       
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
            return x;
            
    }
    
    
 
    
    
}
