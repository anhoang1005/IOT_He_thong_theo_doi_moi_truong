/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.LichSu;
import model.ThongSo;
/**
 *
 * @author Hoang Van An
 */
public class LichSuDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<LichSu> getAllLichSu(){
        List<LichSu> list = new ArrayList<>();
        String query = "SELECT TOP 50 * FROM LichSu\n"
                + "ORDER BY id DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new LichSu(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public LichSu getLichSuLast() {
        String query = "SELECT TOP 1 * FROM ThongSo ORDER BY id DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return new LichSu(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void insertLichsu(String time, String doituong, String trangthai){
        String query = "INSERT INTO [dbo].[LichSu]\n"
                + "           ([time]\n"
                + "           ,[doituong]\n"
                + "           ,[trangthai])\n"
                + "     VALUES (?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, time);
            ps.setString(2, doituong);
            ps.setString(3, trangthai);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public static void main(String[] args) {
        LichSuDAO ldao = new LichSuDAO();
        //ldao.insertLichsu("11/11/2023 11:11:11", "LED 1", "OFF");
        List<LichSu> listl = ldao.getAllLichSu();
        for(LichSu a : listl){
            System.err.println(a.getId() + " " + a.getTime() + " " + a.getTrangthai());
        }
    }
}
