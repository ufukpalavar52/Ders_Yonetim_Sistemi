package com.bitirmeProje.DAO;


import com.bitirmeProje.model.Akademisyen;
import com.bitirmeProje.model.Ders;
import com.bitirmeProje.model.Sinif;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DersDAO {

    public DersDAO() {
        ;
    }

    PreparedStatement st = null;
    ResultSet rs = null;
    Statement st1 = null;

    public int DersEkle(String dersId, String dersAd, int dersKredi, int pratikDersSaati, int teorikDersSaati, int labDersSaati, int bolum_bolumId, int dersYil, int cevap) throws SQLException {

        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();
            int labVar = 0;
            if(labDersSaati > 0) {
                labVar = 1;
            }

            String sql = "insert into ders(dersId,dersAd,dersKredi,pratikDersSaati,teorikDersSaati,labDersSaati,bolum_bolumId,ders_Yil,secmeliMi,labVarMi) values(?,?,?,?,?,?,?,?,?,?) ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, dersId);
            st.setString(2, dersAd);
            st.setInt(3, dersKredi);
            st.setInt(4, pratikDersSaati);
            st.setInt(5, teorikDersSaati);
            st.setInt(6, labDersSaati);
            st.setInt(7, bolum_bolumId);
            st.setInt(8, dersYil);
            st.setInt(9, cevap);
            st.setInt(10, labVar);
            st.executeUpdate();
            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }
        return 0;

    }

    public int DersGuncelle(String dersId, String dersAd, int dersKredi, int pratikDersSaati, int teorikDersSaati, int labDersSaati, int dersYil) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "update ders set dersId=?,dersAd=?,dersKredi=?,pratikDersSaati=?,teorikDersSaati=?,labDersSaati=?,ders_Yil=? Where  dersId = ?";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, dersId);
            st.setString(2, dersAd);
            st.setInt(3, dersKredi);
            st.setInt(4, pratikDersSaati);
            st.setInt(5, teorikDersSaati);
            st.setInt(6, labDersSaati);
            st.setInt(7, dersYil);
            st.setString(8, dersId);
            st.executeUpdate();

            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int AkademisyenDers(String dersId, String akademisyenNo, String donem) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "INSERT INTO ders_has_akademisyan(ders_dersId, akademisyan_akademisyenNo,donem_donemId) VALUES(?,?,?) ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, dersId);
            st.setString(2, akademisyenNo);
            st.setString(3, donem);

            st.executeUpdate();

            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int AkademisyenDersGnc(String dersId, String akademisyenNo, String dersId2, int donem) throws SQLException {
        st = null;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();

        try {

            String sql = "update ders_has_akademisyan set ders_dersId = ? Where ders_dersId = ? and akademisyan_akademisyenNo = ? and donem_donemId = ? ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, dersId);

            st.setString(2, dersId2);
            st.setString(3, akademisyenNo);
            st.setInt(4, donem);

            st.executeUpdate();
            System.out.println(st.executeUpdate());

            return 1;
        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int DersProgrami(String dersId, String sinifId, String saat, String gun, String donem, String akademisyenNo) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "INSERT INTO dersprogrami VALUES(?,?,?,?,?,?,0) ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, sinifId);
            st.setString(2, dersId);
            st.setString(3, saat);
            st.setString(4, gun);
            st.setString(5, donem);
            st.setString(6, akademisyenNo);

            st.executeUpdate();

            return 1;

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }
    public int DersProgrami1(String dersId, String sinifId, String saat, String gun, String donem, String akademisyenNo) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "INSERT INTO dersprogrami VALUES(?,?,?,?,?,?,1) ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, sinifId);
            st.setString(2, dersId);
            st.setString(3, saat);
            st.setString(4, gun);
            st.setString(5, donem);
            st.setString(6, akademisyenNo);

            st.executeUpdate();

            return 1;

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int sinifKontrol(String sinifId, String saat, String gun, String donem) throws SQLException {

        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from dersprogrami where sinif_sinifId = '" + sinifId + "' and saat_saatId = '" + saat + "' and gun_gunId = '" + gun + "' and donem_donemId = '" + donem + "'";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);

            if (rs.next()) {

                return 1;

            } else {
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 2;
    }

    public int akademisyenKontrol(String saat, String gun, String donem, String akademisyenNo) throws SQLException {

        st = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from dersProgrami where saat_saatId = '" + saat + "' and gun_gunId = '" + gun + "' and donem_donemId = '" + donem + "' and akademisyenNo = '" + akademisyenNo + "';";
            st1 = conn.createStatement();

            rs = st1.executeQuery(sql);
            if (rs.next()) {

                return 1;
            } else {
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 2;
    }

    public int dersYiliKontrol(String dersYil, String saat, String gun, String donem, int sec) throws SQLException {
        String sql;
        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();
            if (sec == 0) {
                sql = "SELECT ders_dersId , sinif_sinifId, saat_saatId, gun_gunId, dersprogrami.donem_donemId from ders,dersprogrami WHERE dersId = ders_dersId and ders_Yil = '" + dersYil + "' and saat_saatId = '" + saat + "' and gun_gunId = '" + gun + "' and dersprogrami.donem_donemId = '" + donem + "';";
            } else {
                sql = "SELECT ders_dersId , sinif_sinifId, saat_saatId, gun_gunId, dersprogrami.donem_donemId from ders,dersprogrami WHERE dersId = ders_dersId and ders_Yil = '" + dersYil + "' and saat_saatId = '" + saat + "' and gun_gunId = '" + gun + "' and dersprogrami.donem_donemId = '" + donem + "' and secmeliMi != 1;";
            }

            st1 = conn.createStatement();

            rs = st1.executeQuery(sql);
            if (rs.next()) {

                return 1;
            } else {
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 2;
    }

    public int DonemAktif(String donem) throws SQLException {
        int durum = 0;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "update donem set aktifMi=0 ;";
            st = (PreparedStatement) conn.prepareStatement(sql);

            durum = st.executeUpdate();

        } catch (Exception ex) {

            System.out.println(ex);

        }
        if (durum != 0) {
            try {
                st = null;
                ConnectionDB connect = new ConnectionDB();
                Connection conn = connect.baglanti();
                String sql = "update donem set aktifMi=1 where donemId=?";
                st = (PreparedStatement) conn.prepareStatement(sql);
                st.setString(1, donem);

                st.executeUpdate();

                return 1;

            } catch (Exception ex) {
                System.out.println(ex);
            }

        }

        return 0;
    }

    public int DersProgramiKontrol(String akademisyenNo, String dersId, int donem) throws SQLException {

        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from dersprogrami Where akademisyenNo='" + akademisyenNo + "' and ders_dersId='" + dersId + "' and donem_donemId = '" + donem + "'";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);

            if (rs.next()) {
                System.out.println("Sorgu deger dondurdu");

                return 1;
            } else {
                System.out.println("Sorgu deger dondurmedi");
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        System.out.println("Sorgu hatalı");
        return 2;
    }

    public int DonemEkle(String donemAd, String yil) throws SQLException {
        int durum = 0;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "insert into donem(akademikYil, donemAd) values(?,?) ;";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, yil);
            st.setString(2, donemAd);
            durum = st.executeUpdate();
            return 1;

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int DonemGunc(int donemId, String akademikYil, String donemAd) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "update donem set donemAd = ?, akademikYil = ? where donemId = ? ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setString(1, donemAd);
            st.setString(2, akademikYil);
            st.setInt(3, donemId);

            st.executeUpdate();

            return 1;

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }

    public int DersProgSil(int donemId, String dersId, int saatId, int gunId, int sinifId) throws SQLException {
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Delete from dersprogrami where donem_donemId = ? and ders_dersId = ? and gun_gunId = ? and saat_saatId = ? and sinif_sinifId = ? ";
            st = (PreparedStatement) conn.prepareStatement(sql);
            st.setInt(1, donemId);
            st.setString(2, dersId);
            st.setInt(3, gunId);
            st.setInt(4, saatId);
            st.setInt(5, sinifId);
            st.executeUpdate();

            return 1;

        } catch (Exception ex) {

            System.out.println(ex);

        }

        return 0;
    }
    
    public int DersAtaKontrol(String akademisyenNo, int donem) throws SQLException {

        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from ders_has_akademisyan Where akademisyan_akademisyenNo='" + akademisyenNo + "'  and donem_donemId = '" + donem + "'";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);

            if (rs.next()) {
                System.out.println("Sorgu deger dondurdu");

                return 1;
            } else {
                System.out.println("Sorgu deger dondurmedi");
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        System.out.println("Sorgu hatalı");
        return 2;
    }
    
    public int AktifDonemKontrol() throws SQLException {
        int donem = 0; 
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
        
        String sorgu;
        try {
            sorgu = "Select donemId from donem where aktifMi = 1; ";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sorgu);
            
            if (rs.next()) {
                donem = rs.getInt("donemId");
                
            }
            conn.close();
            
            return donem;   
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
       
        return 0;
    }
    
    public int DersProgramiAkademisyenKontrol(String akademisyenNo) throws SQLException {

        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from dersprogrami Where akademisyenNo='" + akademisyenNo + "';";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);

            if (rs.next()) {
                System.out.println("Sorgu deger dondurdu");

                return 1;
            } else {
                System.out.println("Sorgu deger dondurmedi");
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        System.out.println("Sorgu hatalı");
        return 2;
    }
    
    public int DersProgramiDersKontrol(String dersId) throws SQLException {

        st1 = null;
        rs = null;
        try {
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();

            String sql = "Select *from dersprogrami Where ders_dersId='" + dersId + "';";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);

            if (rs.next()) {
                System.out.println("Sorgu deger dondurdu");

                return 1;
            } else {
                System.out.println("Sorgu deger dondurmedi");
                return 0;
            }

        } catch (Exception ex) {

            System.out.println(ex);

        }

        System.out.println("Sorgu hatalı");
        return 2;
    }
    
    public ArrayList<Sinif> sinifList(String sinifId) {
        try {
            ArrayList <Sinif> sinif = new ArrayList();
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();
            String sql = "Select *from sinif Where sinifId!='" + sinifId + "';";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);
            while (rs.next()) {
                Sinif sinifIs = new Sinif();
                sinifIs.setSinifAd(rs.getString("sinifAd"));
                sinifIs.setSinifId(rs.getInt("sinifId"));
                sinif.add(sinifIs);
            }
            conn.close();
            return sinif;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Sinif> sinifList1() {
        try {
            ArrayList <Sinif> sinif = new ArrayList();
            ConnectionDB connect = new ConnectionDB();
            Connection conn = connect.baglanti();
            String sql = "Select *from sinif ;";
            st1 = conn.createStatement();
            rs = st1.executeQuery(sql);
            while (rs.next()) {
                Sinif sinifIs = new Sinif();
                sinifIs.setSinifAd(rs.getString("sinifAd"));
                sinifIs.setSinifId(rs.getInt("sinifId"));
                sinif.add(sinifIs);
            }
            conn.close();
            return sinif;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    

}
