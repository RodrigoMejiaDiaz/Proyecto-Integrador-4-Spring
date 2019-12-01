/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rodrigo
 */
@Controller
public class controladorPrincipal {
   @RequestMapping("index.htm")
   public ModelAndView index(){
       ModelAndView mvc = new ModelAndView();
       mvc.setViewName("index");
       return mvc;
   }
}
