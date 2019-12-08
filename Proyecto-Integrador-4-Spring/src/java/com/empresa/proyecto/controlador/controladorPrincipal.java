/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.controlador;

import com.empresa.proyecto.DAO.CompraDAOImpl;
import com.empresa.proyecto.DTO.compraDTO;
import com.empresa.proyecto.DTO.itemDTO;
import com.empresa.proyecto.DTO.productoDTO;
import com.empresa.proyecto.DTO.usuarioDTO;
import com.empresa.proyecto.clases.conexion;
import com.empresa.proyecto.modelo.productoDTOModelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
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
       mvc = this.añadirUsuarioMVC(mvc);
       return mvc;
   }
   
   @RequestMapping("categorias.htm")
   public ModelAndView categoria(HttpServletRequest variable, HttpSession session){
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
       mvc = this.añadirUsuarioMVC(mvc);
       
       
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
       mvc = this.añadirUsuarioMVC(mvc);

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
   
   @RequestMapping("carro")
   public ModelAndView carro(HttpServletRequest variable, 
           HttpSession session){
       
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        
        List<usuarioDTO> usuario = new ArrayList<>();
        usuario.add(this.obtenerUsuario());
        
        session.setAttribute("usuario", usuario);
        mvc.addObject("cat", cat);
        mvc.addObject("compraDTO", new compraDTO());
        mvc = this.añadirUsuarioMVC(mvc);

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
   
    @RequestMapping(value = "carro", method = RequestMethod.POST)
    public ModelAndView carro(@ModelAttribute("compraDTO") compraDTO d, 
            SessionStatus status, HttpSession session, HttpServletRequest variable) {
        
        String[] datosCompra = new String[2];
        datosCompra[0] = d.getCod_user();
        datosCompra[1] = String.valueOf(d.getTotal());
        
        List<itemDTO> carro = (List<itemDTO>) session.getAttribute("carro");
        String[] codigoProductos = new String[carro.size()];
        
        String montos[] = variable.getParameterValues("montos");
        String cantidad[] = variable.getParameterValues("cantidad");
        
        for (int n = 0; n < carro.size(); n++) {
            itemDTO item = carro.get(n);
            productoDTO producto = item.getProducto();
            codigoProductos[n] = producto.getCod_prod();
        }
        
        CompraDAOImpl dao = new CompraDAOImpl();
        dao.grabarCompra(datosCompra, codigoProductos, montos, cantidad);
        List<itemDTO> carroNuevo = new ArrayList<>();
        session.setAttribute("carro", carroNuevo);
        
      return new ModelAndView("redirect:/compraTerminada.htm");
    }
   
    @RequestMapping(value = "remover", method = RequestMethod.GET)
    public String remover(HttpServletRequest variable, HttpSession session) {
        String id = variable.getParameter("id");
        List<itemDTO> carro = (List<itemDTO>) session.getAttribute("carro");
        int index = this.existe(id, carro);
        carro.remove(index);
        session.setAttribute("carro", carro);
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
    
    //Añadir el username al modelo enviado
    public ModelAndView añadirUsuarioMVC(ModelAndView mvc){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        mvc.addObject("username", name);
        return mvc;
    }
    
    public usuarioDTO obtenerUsuario() {
        final usuarioDTO usuario = new usuarioDTO();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        
        String sql = "SELECT * from tienda_usuario WHERE username = '"+username+"'";
        try{return (usuarioDTO) plantillaJDBC.query(sql, (ResultSet rs) -> {
            if (rs.next()) {
                usuario.setCod_user(rs.getString("cod_user"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword("nope");
                usuario.setCorreo(rs.getString("correo"));
                usuario.setEnabled(rs.getString("enabled"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setFec_nac(rs.getDate("fec_nac"));
                usuario.setSexo(rs.getString("sexo"));
                usuario.setCompania(rs.getString("compania"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setCod_ciud_id(rs.getString("cod_ciud_id"));
                usuario.setEstado(rs.getString("estado"));
            }
            return usuario;
        });
        } catch (DataAccessException e){
            
        }
        usuario.setCod_user("");
        usuario.setUsername("anonymousUser");
        usuario.setPassword("");
        usuario.setCorreo("");
        usuario.setEnabled("");
        usuario.setNombre("");
        usuario.setApellido("");
        usuario.setCompania("");
        usuario.setTelefono("");
        usuario.setFec_nac(null);
        usuario.setEstado("");
        usuario.setCod_ciud_id("");
        return usuario;
    }
    
    @RequestMapping(value = "salir", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/index.htm";
    }
    
    @RequestMapping(value = "acceso-denegado", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = null;
        if (principal instanceof UserDetails) {
            userDetails = (UserDetails) principal;
        }
        String usuarioLogin = userDetails.getUsername();        
        ModelAndView mvc = new ModelAndView();
        mvc.addObject("usuario", usuarioLogin);
        mvc.setViewName("acceso-denegado");
        return mvc;
    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login(ModelMap model){
        ModelAndView mvc = new ModelAndView();

        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
               
        return mvc;
    }
    
    @RequestMapping(value = "error-login.htm", method = RequestMethod.GET)
    public ModelAndView loginError(){
        ModelAndView mvc = new ModelAndView();
        
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        
        mvc.setViewName("error-login");
        return mvc;
    }  
 
    @RequestMapping(value = "compraTerminada.htm", method = RequestMethod.GET)
    public ModelAndView compraTerminada() {
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc = this.añadirUsuarioMVC(mvc);
        mvc.setViewName("compraTerminada");
        return mvc;
    }
    
    @RequestMapping(value = "registrarse", method = RequestMethod.GET)
    public ModelAndView registrarse(){
        ModelAndView mvc = new ModelAndView();
        mvc.addObject("usuario", new usuarioDTO());
        mvc.setViewName("registrarse");
        return mvc;
    }
}
