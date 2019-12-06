/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.modelo;

import com.empresa.proyecto.DTO.productoDTO;
import com.empresa.proyecto.clases.conexion;
import com.empresa.proyecto.controlador.controladorPrincipal;
import java.sql.ResultSet;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Rodrigo
 */
public class productoDTOModelo {
    
    private final JdbcTemplate plantillaJDBC;
    public productoDTOModelo() {
        conexion xcon = new conexion();
        this.plantillaJDBC = new JdbcTemplate(xcon.conexion());
    }
    
    private List<productoDTO> productos;
    
    public List<productoDTO> findAll() {
        return this.productos;
    }
    
    public productoDTO find(String id){
        final productoDTO productos = new productoDTO();

        String consulta = "SELECT * FROM tienda_producto WHERE cod_prod=" + id;
        return (productoDTO) plantillaJDBC.query(consulta, (ResultSet rs) -> {
            if (rs.next()) {
                productos.setCod_prod(rs.getString("cod_prod"));
                productos.setProducto(rs.getString("producto"));
                productos.setDescripcion(rs.getString("descripcion"));
                productos.setPrecio(Integer.parseInt(rs.getString("precio")));
                productos.setStock(Integer.parseInt(rs.getString("stock")));
                productos.setEstado(rs.getString("estado"));
                productos.setCod_cat_id(Integer.parseInt(rs.getString("cod_cat_id")));
                //productos.setCod_prov_id(Integer.parseInt(rs.getString("cod_prov_id")));
                productos.setImage(rs.getString("image"));
                productos.setDestacado(rs.getString("destacado"));
               
            }
            return productos;
        });
    }
}
