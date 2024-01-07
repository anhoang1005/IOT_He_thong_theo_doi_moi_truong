/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.prism.impl.BaseMesh;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.ThongSo;

/**
 *
 * @author Hoang Van An
 */
public class ThongSoDAO extends DBContext{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<ThongSo> getAllThongSo(){
        List<ThongSo> list = new ArrayList<>();
        String query = "SELECT TOP 1 * FROM ThongSo ORDER BY time DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ThongSo> getSortThongSo(String action, int upordown){
        List<ThongSo> list = new ArrayList<>();
        String query="SELECT TOP 30 * FROM ThongSo";
        if(upordown==1){
            query = query + " ORDER BY CAST(" + action + " AS FLOAT) ASC";
        }
        else if(upordown==0){
            query = query + " ORDER BY CAST(" + action + " AS FLOAT) DESC";
        }
        
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ThongSo> getSortAnhsang(String action, int upordown){
        List<ThongSo> list = new ArrayList<>();
        String query = "SELECT TOP 30 id,time,nhietdo,doam, CAST(anhsang AS INT) AS anhsang_int\n"
                + "FROM ThongSo\n"
                + "ORDER BY anhsang_int " ;
        if(upordown==1){
            query = query + "ASC";
        }
        else if(upordown==0){
            query = query + "DESC";
        }
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ThongSo> searchThongSo(String text, String filter){
        List<ThongSo> list = new ArrayList<>();
        String query = "";
        if(filter.equals("allfilter")){
            query = "SELECT * FROM ThongSo WHERE id LIKE '%" + text + "%' "
                    + "OR time LIKE N'%" + text + "%' "
                    + "OR nhietdo LIKE N'%" + text + "%'"
                    + "OR doam LIKE N'%" + text + "%'"
                    + "OR anhsang LIKE N'%" + text + "%'";           
        }
        else if(filter.equals("idfilter")){
            query = "SELECT * FROM ThongSo WHERE id LIKE N'%" + text + "%'";
        }
        else if(filter.equals("timefilter")){
            query = "SELECT * FROM ThongSo WHERE time LIKE N'%" + text + "%'";
        }
        else if(filter.equals("nhietdofilter")){
            query = "SELECT * FROM ThongSo WHERE nhietdo LIKE N'%" + text + "%'";
        }
        else if(filter.equals("doamfilter")){
            query = "SELECT * FROM ThongSo WHERE doam LIKE N'%" + text + "%'";
        }
        else if(filter.equals("lightfilter")){
            query = "SELECT * FROM ThongSo WHERE anhsang LIKE N'%" + text + "%'";
        }
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void insertThongSo(String time, String nhietdo, String doam, String anhsang){
        /*String query = "DELETE FROM ThongSo\n"
                + "WHERE id = (SELECT MIN(id) FROM ThongSo)\n"
                + "AND (SELECT COUNT(*) FROM ThongSo) >= 50;\n"
                + "\n"
                + "INSERT INTO [dbo].[ThongSo]\n"
                + "           ([time]\n"
                + "           ,[nhietdo]\n"
                + "           ,[doam]\n"
                + "           ,[anhsang])\n"
                + "     VALUES (?, ?, ?, ?)";*/
         String query = "INSERT INTO [dbo].[ThongSo]\n"
                + "           ([time]\n"
                + "           ,[nhietdo]\n"
                + "           ,[doam]\n"
                + "           ,[anhsang])\n"
                + "     VALUES (?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, time);
            ps.setString(2, nhietdo);
            ps.setString(3, doam);
            ps.setString(4, anhsang);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
    
    public int sophantu(){
        int page = 0;
        String query = "SELECT COUNT(*) AS TotalCount\n"
                + "FROM ThongSo;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                page = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return page;
    }
    
    public List<ThongSo> phantrangSortThongSo(String thuoctinh, String updown, String pageString){
        List<ThongSo> list = new ArrayList<>();
        int page = Integer.parseInt(pageString);
        int trangbatdau = (page-1)*30;
        String query = "SELECT *\n"
                + "FROM ThongSo\n"
                + "ORDER BY "
                + thuoctinh
                + " " + updown
                + " OFFSET "
                + trangbatdau
                + " ROWS\n"
                + "FETCH NEXT 30 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ThongSo> phantrangsearchThongSo(String text, String filter, String pageString){
        List<ThongSo> list = new ArrayList<>();
        String query = "";
        int page = Integer.parseInt(pageString);
        int trangbatdau = (page-1)*30;
        if(filter.equals("allfilter")){
            query = "SELECT * FROM ThongSo WHERE id LIKE '%" + text + "%' "
                    + "OR time LIKE N'%" + text + "%' "
                    + "OR nhietdo LIKE N'%" + text + "%'"
                    + "OR doam LIKE N'%" + text + "%'"
                    + "OR anhsang LIKE N'%" + text + "%'"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        else if(filter.equals("idfilter")){
            query = "SELECT *\n"
                    + "FROM ThongSo\n"
                    + "WHERE id LIKE N'%"
                    + text
                    + "%'\n"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        else if(filter.equals("timefilter")){
            query = "SELECT *\n"
                    + "FROM ThongSo\n"
                    + "WHERE time LIKE N'%"
                    + text
                    + "%'\n"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        else if(filter.equals("nhietdofilter")){
            query = "SELECT *\n"
                    + "FROM ThongSo\n"
                    + "WHERE nhietdo LIKE N'%"
                    + text
                    + "%'\n"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        else if(filter.equals("doamfilter")){
            query = "SELECT *\n"
                    + "FROM ThongSo\n"
                    + "WHERE doam LIKE N'%"
                    + text
                    + "%'\n"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        else if(filter.equals("lightfilter")){
            query = "SELECT *\n"
                    + "FROM ThongSo\n"
                    + "WHERE anhsang LIKE N'%"
                    + text
                    + "%'\n"
                    + "ORDER BY id\n"
                    + "OFFSET "
                    + trangbatdau
                    + " ROWS\n"
                    + "FETCH NEXT 30 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public ThongSo getThongSoLast() {
        String query = "SELECT TOP 1 * FROM ThongSo ORDER BY id DESC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return new ThongSo(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        ThongSoDAO tsdao = new ThongSoDAO();
        System.err.println(tsdao.sophantu());
        List<ThongSo> listT = tsdao.phantrangSortThongSo("id", "ASC", "2");
        for(ThongSo a : listT){
            System.err.println(a.getId()+" "+a.getTime()+" "+a.getDoam()+ " " + a.getAnhsang());
        }
    }
}
