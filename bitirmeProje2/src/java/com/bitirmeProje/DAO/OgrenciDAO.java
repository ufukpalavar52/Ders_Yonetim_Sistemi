
package com.bitirmeProje.DAO;


import com.bitirmeProje.model.Ogrenci;
import com.mysql.jdbc.PreparedStatement;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class OgrenciDAO {
    ResultSet rs  = null;
    Statement st = null;
    
    public OgrenciDAO(){
        ;
    }
    
    public ArrayList<Ogrenci> OgrenciLogin(String ogrenciNo,String ogrenciSifre) throws SQLException{
        
      ArrayList<Ogrenci> arrayList = new ArrayList();
        
        HttpServletRequest request = null;
        ConnectionDB connect = new ConnectionDB();
        Connection conn = connect.baglanti();
       
       
       String sql = "SELECT * FROM ogrenci where ogrenciNo='" + ogrenciNo + "' and ogrenciSifre = '" + ogrenciSifre + "';";
            
        try {
            
            
            
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            
            if(rs.next()){
                
                Ogrenci talebe = new Ogrenci();
                talebe.setOgrenciAd(rs.getString("ogrenciAd"));
                talebe.setOgrenciSoyad(rs.getString("ogrenciSoyad"));
                talebe.setOgrenciNo(rs.getString("ogrenciNo"));
                talebe.setOgrenciSifre(rs.getString("ogrenciSifre"));
                talebe.setOgrenciEposta(rs.getString("ogrenciEposta"));
                talebe.setOgrenciCepTel(rs.getString("ogrenciCepTel"));
                talebe.setBolum_BolumId(rs.getInt("bolum_bolumId"));
                
                
                
                arrayList.add(talebe);
               
             
                //session.setAttribute("ogrenciNo",ogrenciNo);
                   return arrayList;
                 //request.getRequestDispatcher("index.jsp").include(request, response);  
            }
            
           
        } catch (SQLException ex) {
            Logger.getLogger(OgrenciDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
      return null;
    }
    public int OgrenciEkle(String ogrenciNo,String ad,String soyad,String email,String sifre, int bolumId) throws SQLException
    {
        try{
                     PreparedStatement st = null;
		     ConnectionDB connect = new ConnectionDB();
		     Connection conn = connect.baglanti();
		     
		     String sql = "INSERT INTO ogrenci(ogrenciNo, ogrenciAd, ogrenciSoyad, ogrenciSifre, ogrenciEposta, bolum_bolumId) VALUES(?,?,?,?,?,?) ";
		     st = (PreparedStatement) conn.prepareStatement(sql);
		     st.setString(1,ogrenciNo);
		     st.setString(2,ad);
		     st.setString(3,soyad);
		     st.setString(4,sifre);
		     st.setString(5,email);
		     st.setInt(6,bolumId);
		     
		     
		     
		     st.executeUpdate();
		     return 1;	
		 }
		  catch (SQLException ex) {
			 
		      System.out.println(ex);
		      
		 }
        
        return 0;
    }
    public int OgrenciGunc(String ogrenciNo, String ad, String soyad, String email, String eskiNo){
        try{
    		     PreparedStatement st = null;
		     ConnectionDB connect = new ConnectionDB();
		     Connection conn = connect.baglanti();
		     
		     String sql = "Update ogrenci set ogrenciNo=?,ogrenciAd=?,ogrenciSoyad=?,ogrenciEposta=? where ogrenciNo=? ";
		     st = (PreparedStatement) conn.prepareStatement(sql);
		     st.setString(1,ogrenciNo);
		     st.setString(2,ad);
		     st.setString(3,soyad);
		     
		     st.setString(4,email);
		     
		     st.setString(5,eskiNo);
		     
		     
		     st.executeUpdate();
			 return 1;
		 }
		  catch (Exception ex) {
			 
		      System.out.println(ex);
		      
		 }
 		
		
       return 0;
    }
    public int OgrenciProfilGunc(String ogrenciNo, String email,String tel, String sifre,String sifre1){
        try{
    		     PreparedStatement st = null;
		     ConnectionDB connect = new ConnectionDB();
		     Connection conn = connect.baglanti();
		     
		     String sql = "Update ogrenci set ogrenciEposta=?,ogrenciCepTel=?, ogrenciSifre=? where ogrenciNo=? and ogrenciSifre=? ";
		     st = (PreparedStatement) conn.prepareStatement(sql);
		     st.setString(1,email);
		     st.setString(2,tel);
		     
		     st.setString(3,sifre1);
		     st.setString(4,ogrenciNo);
		     
		     st.setString(5,sifre);
		     
		     
		     
		     return st.executeUpdate();
		 }
		  catch (SQLException ex) {
			 
		      System.out.println(ex);
		      
		 }
 		
		
        return 0;
    }
}