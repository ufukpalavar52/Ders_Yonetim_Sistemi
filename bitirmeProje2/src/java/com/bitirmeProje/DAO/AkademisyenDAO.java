package com.bitirmeProje.DAO;

import com.bitirmeProje.model.Akademisyen;
import com.bitirmeProje.model.Ders;
import com.mysql.jdbc.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class AkademisyenDAO {

    public AkademisyenDAO() {
        ;
    }

    ResultSet rs = null;
    Statement st = null;

    public ArrayList<Akademisyen> AkademisyenLogin(String akademisyenNo, String akademisyenSifre) throws SQLException {

        ArrayList<Akademisyen> arrayList = new ArrayList();

        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();

        String sql = "CALL sp_kontrol('" + akademisyenNo + " ','" + akademisyenSifre + "')";
        //String sql = "SELECT * FROM akademisyen,akademisyan_has_yetki where akademisyenNo='" + akademisyenNo + "' and akademisyenSifre = '" + akademisyenSifre + "' akademisyan_akademisyenNo=akademisyenNo";

        try {

            st = conn.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {

                Akademisyen akademik = new Akademisyen();
                akademik.setAkademisyenAd(rs.getString("akademisyenAd"));
                akademik.setAkademisyenSoyad(rs.getString("akademisyenSoyad"));
                akademik.setAkademisyenNo(rs.getString("akademisyenNo"));
                akademik.setAkademisyenSifre(rs.getString("akademisyenSifre"));
                akademik.setAkademisyenEposta(rs.getString("akademisyenEposta"));
                akademik.setAkademisyenCepTel(rs.getString("akademisyenCepTel"));
                akademik.setAkademisyenIsTel(rs.getString("akademisyenIsTel"));
                akademik.setAkademisyenBolumId(rs.getString("bolum_bolumId"));
                akademik.setAkademisyenYetki(rs.getInt("yetki_yetkiId"));
                arrayList.add(akademik);
                System.out.println(arrayList.get(0));

                return arrayList;

            }

        } catch (SQLException ex) {
            Logger.getLogger(AkademisyenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<Akademisyen> AkademisyenAra(String akademisyenAd) throws SQLException {

        ArrayList<Akademisyen> arrayList = new ArrayList();
        String[] str = akademisyenAd.split(" ");
        int s = str.length;
        String ad = "";
        String soyad = "";
        String sql = "";
        if(s > 2 && s < 4) {
            ad = str[0]+" "+str[1];
            soyad = str[2];
            sql = "SELECT akademisyenAd,akademisyenSoyad, akademisyenEposta,akademisyenIsTel,akademisyenNo,akademisyenCepTel,bolumAd FROM akademisyen LEFT JOIN bolum ON bolum_bolumId = bolumId WHERE akademisyenAd = '" + ad + "' and akademisyenSoyad = '" + soyad + "';";

        }
        else if (s > 1 && s < 3){
            ad = str[0];
            soyad = str[1];
            sql = "SELECT akademisyenAd,akademisyenSoyad, akademisyenEposta,akademisyenIsTel,akademisyenNo,akademisyenCepTel,bolumAd FROM akademisyen LEFT JOIN bolum ON bolum_bolumId = bolumId WHERE akademisyenAd = '" + ad + "' and akademisyenSoyad = '" + soyad + "';";

        }
        else {
           sql = "SELECT akademisyenAd,akademisyenSoyad, akademisyenEposta,akademisyenIsTel,akademisyenNo,akademisyenCepTel,bolumAd FROM akademisyen LEFT JOIN bolum ON bolum_bolumId = bolumId WHERE akademisyenAd like '" + akademisyenAd + "%' or akademisyenSoyad = '" + akademisyenAd + "';";
   
        } 
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();

        
        try {

            st = conn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                Akademisyen akademik = new Akademisyen();
                akademik.setAkademisyenAd(rs.getString("akademisyenAd"));
                akademik.setAkademisyenSoyad(rs.getString("akademisyenSoyad"));
                akademik.setAkademisyenNo(rs.getString("akademisyenNo"));

                akademik.setAkademisyenEposta(rs.getString("akademisyenEposta"));
                akademik.setAkademisyenCepTel(rs.getString("akademisyenCepTel"));
                akademik.setAkademisyenIsTel(rs.getString("akademisyenIsTel"));

                akademik.setBolumAd(rs.getString("bolumAd"));

                arrayList.add(akademik);

            }
            return arrayList;

        } catch (SQLException ex) {
            Logger.getLogger(AkademisyenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList<Akademisyen> AkademisyenList(String bolumId, int donemId) throws SQLException {

        ArrayList<Akademisyen> arrayList = new ArrayList();

        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();

        String sql = "SELECT distinct donem_donemId,akademisyenAd,akademisyenSoyad, akademisyenEposta,akademisyenIsTel,akademisyenNo,akademisyenCepTel FROM akademisyen, ders_has_akademisyan "
                + "Where bolum_bolumId = '" + bolumId + "' and akademisyenNo = akademisyan_akademisyenNo and donem_donemId = '" + donemId + "';";

        try {

            st = conn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                Akademisyen akademik = new Akademisyen();
                akademik.setAkademisyenAd(rs.getString("akademisyenAd"));
                akademik.setAkademisyenSoyad(rs.getString("akademisyenSoyad"));
                akademik.setAkademisyenNo(rs.getString("akademisyenNo"));

                akademik.setAkademisyenEposta(rs.getString("akademisyenEposta"));
                akademik.setAkademisyenCepTel(rs.getString("akademisyenCepTel"));
                akademik.setAkademisyenIsTel(rs.getString("akademisyenIsTel"));

                arrayList.add(akademik);

            }
            return arrayList;

        } catch (SQLException ex) {
            Logger.getLogger(AkademisyenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public int AkademisyenEkle(String bolum, String akademisyenNo, String ad, String soyad, String sifre, String email, String istel, String ceptel, int cevap) throws SQLException {

        try {
            PreparedStatement st = null;
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "INSERT INTO akademisyen(bolum_bolumId,akademisyenNo, akademisyenAd, akademisyenSoyad, akademisyenSifre, akademisyenEposta, akademisyenCepTel, akademisyenIsTel,pasifMi) VALUES(?,?,?,?,?,?,?,?,0) ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setInt(1, Integer.valueOf(bolum));
            st.setString(2, akademisyenNo);
            st.setString(3, ad);
            st.setString(4, soyad);
            st.setString(5, sifre);
            st.setString(6, email);
            st.setString(7, ceptel);
            st.setString(8, istel);

            st.executeUpdate();

        } catch (Exception ex) {

            System.out.println(ex);

        }

        try {
            PreparedStatement st = null;
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "INSERT INTO akademisyan_has_yetki(akademisyan_akademisyenNo,yetki_yetkiId) VALUES(?,?) ";
            st = (PreparedStatement) conn.prepareStatement(sql);

            st.setString(1, akademisyenNo);
            st.setInt(2, cevap);

            st.executeUpdate();
            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;

    }

    public int AkademisyenGunc(int bolum, String akademisyenNo, String ad, String soyad, String email, String istel, String ceptel, int cevap, String eskiNo) throws SQLException {

        try {
            PreparedStatement st = null;
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "update akademisyen, akademisyan_has_yetki set akademisyenNo=?, akademisyenAd=?, akademisyenSoyad=?, akademisyenEposta=?, akademisyenIsTel=?, akademisyenCepTel=?, bolum_bolumId=?, yetki_yetkiId=? Where akademisyan_akademisyenNo=? and akademisyenNo=? ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, akademisyenNo);
            st.setString(2, ad);
            st.setString(3, soyad);

            st.setString(4, email);
            st.setString(5, istel);
            st.setString(6, ceptel);
            st.setInt(7, bolum);
            st.setInt(8, cevap);
            st.setString(9, eskiNo);
            st.setString(10, eskiNo);

            st.executeUpdate();
            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public ArrayList<Ders> bolumDers(String bolumId) throws SQLException {
        ArrayList<Ders> arrayList = new ArrayList<Ders>();

        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();

        String sql = "SELECT * FROM ders where bolum_bolumId='" + bolumId + "';";

        try {

            st = conn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {

                Ders ders = new Ders();
                ders.setDersAd(rs.getString("dersAd"));
                ders.setDersId(rs.getString("dersId"));
                ders.setDersKredi(rs.getInt("dersKredi"));
                ders.setTeorikDersSaati(rs.getInt("teorikDersSaati"));
                ders.setLabDersSaati(rs.getInt("labDersSaati"));
                arrayList.add(ders);

            }
            return arrayList;

        } catch (SQLException ex) {
            Logger.getLogger(AkademisyenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }

    public int AkademisyenProfilGunc(String akademisyenNo, String email, String tel, String cep, String sifre, String sifre1) {
        try {
            PreparedStatement st = null;
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Update akademisyen set akademisyenEposta=?,akademisyenIsTel=?,akademisyenCepTel=?,akademisyenSifre=? where akademisyenNo=? and akademisyenSifre=? ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, tel);

            st.setString(3, cep);
            st.setString(4, sifre1);

            st.setString(5, akademisyenNo);
            st.setString(6, sifre);

            return st.executeUpdate();
        } catch (SQLException ex) {

            System.out.println(ex);

        }

        return 0;
    }
    public int AkademisyenPasif(int pasif, String akademisyenNo) throws SQLException {

        try {
            PreparedStatement st = null;
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "update akademisyen set pasifMi=? where akademisyenNo=?";
            st = (PreparedStatement) conn.prepareStatement(sql);
            
            st.setInt(1, pasif);
            st.setString(2, akademisyenNo);
            

            st.executeUpdate();
            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

}
