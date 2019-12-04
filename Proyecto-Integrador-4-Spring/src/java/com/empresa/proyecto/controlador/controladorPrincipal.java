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
       mvc.addObject("cat", cat);
       mvc.setViewName("index");
       return mvc;
   }
}
