/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DAO;


/**
 *
 * @author Rodrigo
 */
public interface CompraDAO {
    
    public boolean grabarCompra(String[] datosCompra, String[] codigoProductos, 
            String[] montos, String[] cantidad);


}
