/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Van An
 */
public class ThongSo {
    private int id;
    private String time;
    private String nhietdo;
    private String doam;
    private String anhsang;
    
    public ThongSo(){
    }

    public ThongSo(int id, String time, String nhietdo, String doam, String anhsang) {
        this.id = id;
        this.time = time;
        this.nhietdo = nhietdo;
        this.doam = doam;
        this.anhsang = anhsang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getNhietdo() {
        return nhietdo;
    }

    public void setNhietdo(String nhietdo) {
        this.nhietdo = nhietdo;
    }

    public String getDoam() {
        return doam;
    }

    public void setDoam(String doam) {
        this.doam = doam;
    }

    public String getAnhsang() {
        return anhsang;
    }

    public void setAnhsang(String anhsang) {
        this.anhsang = anhsang;
    }
    
    
}
