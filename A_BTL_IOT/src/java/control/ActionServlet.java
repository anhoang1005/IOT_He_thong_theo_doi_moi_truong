    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import com.google.gson.Gson;
import dao.ThongSoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ThongSo;

/**
 *
 * @author Hoang Van An
 */
@WebServlet(name="actionServlet", urlPatterns={"/action"})
public class ActionServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String command = request.getParameter("command");
        String page = request.getParameter("page");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();    
        ThongSoDAO tsdao = new ThongSoDAO();
        if(command.equals("idup")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("id", "ASC", page);
            Collections.reverse(listT);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("iddown")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("id", "DESC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("timeup")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("time", "ASC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("timedown")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("time", "DESC", page);
            Collections.reverse(listT);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("anhsangup")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("anhsang", "ASC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("anhsangdown")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("anhsang", "DESC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("doamup")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("doam", "ASC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("doamdown")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("doam", "DESC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("nhietdoup")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("nhietdo", "ASC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("nhietdodown")){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("nhietdo", "DESC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(command.equals("search")){
            String text = request.getParameter("text");
            String filter = request.getParameter("fil");
            List<ThongSo> listT = tsdao.phantrangsearchThongSo(text, filter, page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
        
        else if(page!=null){
            List<ThongSo> listT = tsdao.phantrangSortThongSo("nhietdo", "DESC", page);
            String json = new Gson().toJson(listT);
            out.print(json);
            out.flush();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
