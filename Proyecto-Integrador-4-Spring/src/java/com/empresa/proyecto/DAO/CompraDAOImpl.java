/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DAO;

import com.empresa.proyecto.clases.conexion;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author Rodrigo
 */
public class CompraDAOImpl implements CompraDAO {

    @Override
    public boolean grabarCompra(String[] datosCompra, String[] codigoProductos) {
        conexion xcon = new conexion();
        boolean registrar = true;
        Statement stm = null;
        Connection con = null;
        
        String sql = "INSERT INTO tienda_compra(cod_compra, cod_user, total, "
                + "fecha_compra) VALUES (?,?,?,?)";
        
        String cod_compra = xcon.generarCodigo("tienda_compra", "cod_compra");
        
        return registrar;
        
    }
    
    public String getFecha() {
        Calendar calendar = new GregorianCalendar();
        Date date = calendar.getTime();
        DateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        return formato.format(date);
    }


    

}
