/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.controlador;

import com.empresa.proyecto.DTO.itemDTO;
import com.empresa.proyecto.DTO.productoDTO;
import com.empresa.proyecto.clases.conexion;
import com.empresa.proyecto.modelo.productoDTOModelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
       String sql = "SELECT cod_cat, categoria, image FROM tienda_categoria_producto";
       List cat = this.plantillaJDBC.queryForList(sql);
       
       String sql2 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE destacado='A' LIMIT 3";
       List prod = this.plantillaJDBC.queryForList(sql2);
       
       String sql3 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE destacado='A' LIMIT 6";
       List prod2 = this.plantillaJDBC.queryForList(sql3);
       
       String sql4 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE destacado='A' LIMIT 9";
       List prod3 = this.plantillaJDBC.queryForList(sql4);
       
       //Eliminar elementos repetidos de segundo conjunto de productos destacados
       for(int o=0; o < 3; o++){
           for (int i = 0; i < 1; i++) {
               try {
                   prod2.remove(i);
               } catch (Exception e) {
               }
           }
       }
       //Eliminar elementos repetidos de tercer conjunto de productos destacados
       for (int o = 0; o < 6; o++) {
           for (int i = 0; i < 1; i++) {
               try {
                   prod3.remove(i);
               } catch (Exception e) {
               }
           }
       }
       
       mvc.addObject("cat", cat);
       mvc.addObject("prod", prod);
       mvc.addObject("prod2", prod2);
       mvc.addObject("prod3", prod3);
       mvc.setViewName("index");
       return mvc;
   }
   
   @RequestMapping("categorias.htm")
   public ModelAndView categoria(HttpServletRequest variable){
       ModelAndView mvc = new ModelAndView();
       mvc.setViewName("categorias");
       String cod_cat = variable.getParameter("cod_cat");
       
       List cat = this.listaCategorias();
       
       String sql2 = "SELECT cod_prod, producto, precio, cod_cat_id, stock, estado, image FROM tienda_producto WHERE cod_cat_id="+cod_cat;
       List prod = this.plantillaJDBC.queryForList(sql2);
       
       int cant = prod.size();
       
       mvc.addObject("cod_cat", cod_cat);
       mvc.addObject("cat", cat);
       mvc.addObject("prod", prod);
       mvc.addObject("cant", cant);
       return mvc;
   }
   
   @RequestMapping("producto.htm")
   public ModelAndView producto(HttpServletRequest variable){
       ModelAndView mvc = new ModelAndView();
       mvc.setViewName("producto");
       String cod_prod = variable.getParameter("cod_prod");
       String cod_cat = variable.getParameter("cod_cat");
       
       productoDTO producto = this.seleccionarProducto(cod_prod);
       
       List cat = this.listaCategorias();
       
       String sql2 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE cod_cat_id='"+producto.getCod_cat_id()+"' LIMIT 3";
       List prod = this.plantillaJDBC.queryForList(sql2);

       String sql3 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE cod_cat_id='"+producto.getCod_cat_id()+"' LIMIT 6";
       List prod2 = this.plantillaJDBC.queryForList(sql3);

       String sql4 = "SELECT cod_prod, producto, precio, stock, estado, cod_cat_id, image, destacado FROM tienda_producto WHERE cod_cat_id='"+producto.getCod_cat_id()+"' LIMIT 9";
       List prod3 = this.plantillaJDBC.queryForList(sql4);

       //Eliminar elementos repetidos de segundo conjunto de productos relacionados
       for (int o = 0; o < 3; o++) {
           for (int i = 0; i < 1; i++) {
               try{
                   prod2.remove(i);
               } catch(Exception e) {
               }
           }
       }
       //Eliminar elementos repetidos de tercer conjunto de productos relacionados
       for (int o = 0; o < 6; o++) {
           for (int i = 0; i < 1; i++) {
               try {
                   prod3.remove(i);
               } catch (Exception e) {
               }
           }
       }
       
       mvc.addObject("producto", producto);
       mvc.addObject("prod_rel_1", prod);
       mvc.addObject("prod_rel_2", prod2);
       mvc.addObject("prod_rel_3", prod3);
       mvc.addObject("cat", cat);
       mvc.addObject("cod_cat", cod_cat);
       
       return mvc;
   }
   
   public productoDTO seleccionarProducto(String cod_prod){
       final productoDTO producto = new productoDTO();
       String sql = "SELECT * FROM tienda_producto WHERE cod_prod=" + cod_prod;
       return (productoDTO) plantillaJDBC.query(sql, (ResultSet rs) -> {
           if (rs.next()) {
               producto.setCod_prod(rs.getString("cod_prod"));
               producto.setProducto(rs.getString("producto"));
               producto.setDescripcion(rs.getString("descripcion"));
               producto.setPrecio(Integer.parseInt(rs.getString("precio")));
               producto.setStock(Integer.parseInt(rs.getString("stock")));
               producto.setCod_cat_id(Integer.parseInt(rs.getString("cod_cat_id")));
               producto.setImage(rs.getString("image"));
           }
           return producto;
       });
   }
   
   public List listaCategorias(){
       String sql = "SELECT * FROM tienda_categoria_producto";
       List cat = this.plantillaJDBC.queryForList(sql);
       return cat;
   }
   
   @RequestMapping("carro.htm")
   public ModelAndView carro(HttpServletRequest variable){
        ModelAndView mvc = new ModelAndView();
        return mvc;
   }
   
   @RequestMapping(value = "comprar", method = RequestMethod.GET)
   public String comprar(HttpServletRequest variable, HttpSession session){
       String id = variable.getParameter("id");
       productoDTOModelo productoModelo = new productoDTOModelo();
       if (session.getAttribute("carro") == null) {
           List<itemDTO> carro = new ArrayList<>();
           carro.add(new itemDTO(productoModelo.find(id), 1));
           session.setAttribute("carro", carro);
       } else {
           List<itemDTO> carro = (List<itemDTO>) session.getAttribute("carro");
           int index = this.existe(id, carro);
           if (index == -1){
               carro.add(new itemDTO(productoModelo.find(id), 1));
           } else {
               int cantidad = carro.get(index).getCantidad() + 1;
               carro.get(index).setCantidad(cantidad);
           }
           session.setAttribute("carro", carro);
       }
       return "redirect:/carro.htm";
   }
       
       private int existe(String id, List<itemDTO> carro){
           for (int i = 0; i < carro.size(); i++) {
               if (carro.get(i).getProducto().getCod_prod().equalsIgnoreCase(id)){
                   return i;
               }
           }
           return -1;
       }
}
