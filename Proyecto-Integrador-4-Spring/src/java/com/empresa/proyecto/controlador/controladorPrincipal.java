/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.controlador;

import com.empresa.proyecto.clases.conexion;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rodrigo
 */
@Controller
public class controladorPrincipal {
    private JdbcTemplate plantillaJDBC;
    
    public controladorPrincipal(){
        conexion xcon = new conexion();
        this.plantillaJDBC = new JdbcTemplate(xcon.conexion());
    }
    
   @RequestMapping("index.htm")
   public ModelAndView index(){
       ModelAndView mvc = new ModelAndView();
       String sql = "SELECT * FROM tienda_categoria_producto";
       List cat = this.plantillaJDBC.queryForList(sql);
       
       String sql2 = "SELECT * FROM tienda_producto WHERE destacado='A' LIMIT 3";
       List prod = this.plantillaJDBC.queryForList(sql2);
       
       String sql3 = "SELECT * FROM tienda_producto WHERE destacado='A' LIMIT 6";
       List prod2 = this.plantillaJDBC.queryForList(sql3);
       
       String sql4 = "SELECT * FROM tienda_producto WHERE destacado='A' LIMIT 9";
       List prod3 = this.plantillaJDBC.queryForList(sql4);
       
       //Eliminar elementos repetidos de segundo conjunto de productos destacados
       for(int o=0; o < 3; o++){
           for (int i = 0; i < 1; i++) {
               prod2.remove(i);
           }
       }
       //Eliminar elementos repetidos de tercer conjunto de productos destacados
       for (int o = 0; o < 6; o++) {
           for (int i = 0; i < 1; i++) {
               prod3.remove(i);
           }
       }
       
       mvc.addObject("cat", cat);
       mvc.addObject("prod", prod);
       mvc.addObject("prod2", prod2);
       mvc.addObject("prod3", prod3);
       mvc.setViewName("index");
       return mvc;
   }
}
