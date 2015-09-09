/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.Session;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Sabari
 */
public class ProfileImage extends HttpServlet {
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        /*
         *Set the size threshold, above which content will be stored on disk.
         */
        fileItemFactory.setSizeThreshold(1 * 1024 * 1024); //1 MB
		/*
         * Set the temporary directory to store the uploaded files of size above threshold.
         */
        fileItemFactory.setRepository(tmpDir);

        ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
        Connection con = null;
        PreparedStatement pstm = null;
        FileInputStream fis = null;
        long size = 0;
   try {
            /*
             * Parse the request
             */
            con = databasecon.getconnection();
            
            
            pstm=con.prepareStatement("delete from profile where userid='"+request.getSession().getAttribute("userid") +"'");
            pstm.executeUpdate();
            
            pstm=null;
            
            List items = uploadHandler.parseRequest(request);
            Iterator itr = items.iterator();
            while(itr.hasNext()){
                 FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                }else{
            
                    
                    String sql="insert into profile values(?,?,?)";
            pstm=con.prepareStatement(sql);
            pstm.setString(1, request.getSession().getAttribute("userid")+"");
            pstm.setBinaryStream(2, item.getInputStream(), item.getSize());
            pstm.setString(3, item.getName());
            pstm.executeUpdate();
            response.sendRedirect("userpage.jsp?msg=Uploaded");           }
        }
            
            
        }catch (Exception ex) {
            ex.printStackTrace();
        //    response.sendRedirect("userHome.jsp?msg=Cloud Not Connected");
            // log("Error encountered while uploading file", ex);
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
