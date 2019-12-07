/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DAO;

import com.empresa.proyecto.clases.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rodrigo
 */
public class CompraDAOImpl implements CompraDAO {

    @Override
    public boolean grabarCompra(String[] datosCompra, String[] codigoProductos,
            String[] montos,String[] cantidad) {
        conexion xcon = new conexion();
        boolean registrar = true;
        Statement stm = null;
        Connection con = null;
        
        String sql = "INSERT INTO tienda_compra(cod_compra, cod_user, total, "
                + "fecha_compra) VALUES (?,?,?,?)";
        
        String cod_compra = xcon.generarCodigo("tienda_compra", "cod_compra");
        String cod_user = datosCompra[0];
        String total = datosCompra[1];
        String fecha_compra = this.getFecha();
        
        try{
            con = xcon.Conectar();
            stm = con.createStatement();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cod_compra);
            ps.setString(2, cod_user);
            ps.setString(3, total);
            ps.setString(4, fecha_compra);
            ps.executeUpdate();
            
            for(int xc = 0; xc<codigoProductos.length; xc++){
                String cod_prod = codigoProductos[xc];
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompraDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return registrar;
        
    }
    
    public String getFecha() {
        Calendar calendar = new GregorianCalendar();
        Date date = calendar.getTime();
        DateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        return formato.format(date);
    }

    @Override
    public boolean insertarDetalle(String cod_compra, String[] codigoProductos, 
            String[] montos, String[] cantidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    

}
