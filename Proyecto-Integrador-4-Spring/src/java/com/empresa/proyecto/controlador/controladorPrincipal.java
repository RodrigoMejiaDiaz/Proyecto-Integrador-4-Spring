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
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
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
@MultipartConfig(fileSizeThreshold=1024*1024*2,
                 maxFileSize=1024*1024*10,
                 maxRequestSize=1024*1024*50)
@Controller
public class controladorPrincipal {
    private JdbcTemplate plantillaJDBC;
    private static final String SAVE_DIR_PROD = "images";

    
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
   
    public productoDTO seleccionarProducto(String id) {
        final productoDTO productos = new productoDTO();
        String sql = "SELECT * FROM tienda_producto WHERE cod_prod=" + id;
        return (productoDTO) plantillaJDBC.query(sql, (ResultSet rs) -> {
            if (rs.next()) {
                productos.setCod_prod(rs.getString("cod_prod"));
                productos.setProducto(rs.getString("producto"));
                productos.setDescripcion(rs.getString("descripcion"));
                productos.setPrecio(Integer.parseInt(rs.getString("precio")));
                productos.setStock(Integer.parseInt(rs.getString("stock")));
                productos.setEstado(rs.getString("estado"));
                productos.setCod_cat_id(Integer.parseInt(rs.getString("cod_cat_id")));
                productos.setCod_prov_id(Integer.parseInt(rs.getString("cod_prov_id")));
                productos.setImage(rs.getString("image"));
                productos.setDestacado(rs.getString("destacado"));
            }
            return productos;
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
        String role = auth.getAuthorities().toString();
        mvc.addObject("username", name);
        mvc.addObject("rol", role);
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
                usuario.setFec_nac(rs.getString("fec_nac"));
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
        usuario.setNombre("");
        usuario.setApellido("");
        usuario.setFec_nac(null);
        usuario.setSexo("");
        usuario.setCompania("");
        usuario.setTelefono("");
        usuario.setDireccion("");
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
    
    @RequestMapping(value = "registrarse")
    public ModelAndView registrarse(){
        ModelAndView mvc = new ModelAndView("formulario");
        List cat = this.listaCategorias();
        mvc.addObject("usuario", new usuarioDTO());
        mvc.setViewName("registrarse");
        mvc.addObject("cat", cat);
        return mvc;
    }
    
    @RequestMapping(value = "registrarse", method = RequestMethod.POST)
    public ModelAndView registrarse(
            @Valid @ModelAttribute("usuario") usuarioDTO d,
            BindingResult result,
            SessionStatus status) {
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("registrarse");
            List cat = this.listaCategorias();
            mav.addObject("cat", cat);
            return mav;
        } else {
            this.plantillaJDBC.update(
                    "INSERT INTO tienda_usuario (username,password,correo,enabled,nombre,"
                            + "apellido,fec_nac, sexo, compania, telefono, direccion, "
                            + "cod_ciud_id, estado) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?,?)", d.getUsername(),d.getPassword(),
                    d.getCorreo(), 1, d.getNombre(), d.getApellido(), d.getFec_nac(), d.getSexo(),
                    d.getCompania(), d.getTelefono(), d.getDireccion(), 1, "A"
            );
            return new ModelAndView("redirect:/registrarseCompleto.htm");
        }
    }
    
    @RequestMapping(value = "registrarseCompleto")
    public ModelAndView registrarseCompleto(){
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc.addObject("usuario", new usuarioDTO());
        mvc.setViewName("registrarseCompleto");
        return mvc;
    }
    
    @RequestMapping(value = "admin-productos")
    public ModelAndView admin_productos(){
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc = this.añadirUsuarioMVC(mvc);
        
        String sql = "SELECT * FROM tienda_producto";
        List productos = this.plantillaJDBC.queryForList(sql);
        
        String sql2 = "SELECT * FROM tienda_proveedor";
        List proveedores = this.plantillaJDBC.queryForList(sql2);
        
        mvc.addObject("productos", productos);
        mvc.addObject("proveedores", proveedores);
        
        mvc.setViewName("admin-productos");

        return mvc;
    }
    
    @RequestMapping(value = "agregar-productos", method = RequestMethod.GET)
    public ModelAndView agregar_productos(){
        ModelAndView mvc = new ModelAndView("agregar-productos");
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc = this.añadirUsuarioMVC(mvc);
        
        String sql = "SELECT * FROM tienda_proveedor";
        List proveedores = this.plantillaJDBC.queryForList(sql);
        
        mvc.addObject("productos", new productoDTO());
        mvc.addObject("proveedores", proveedores);
        
        mvc.setViewName("agregar-productos");
        
        return mvc;        
    }
    
    @RequestMapping(value = "resultado-agregar-productos.htm", method = RequestMethod.POST)
    public ModelAndView resultado_agregar_productos(
            HttpServletRequest request, @Valid @ModelAttribute("productos") productoDTO d,BindingResult rpta
    ) throws IOException, ServletException{
        if(rpta.hasErrors()){
            ModelAndView mav = new ModelAndView("agregar-productos");
            List cat = this.listaCategorias();
            mav.addObject("cat", cat);
            mav = this.añadirUsuarioMVC(mav);
            String sql = "SELECT * FROM tienda_proveedor";
            List proveedores = this.plantillaJDBC.queryForList(sql);
            mav.addObject("proveedores", proveedores);
            return mav;
        } else {
            conexion xcon = new conexion();
            String cod_prod = xcon.generarCodigo("tienda_producto", "cod_prod");

            Part part = request.getPart("file");
            String fileName = extractFileName(part);
            String imageInDB = SAVE_DIR_PROD + File.separator + fileName;
            if (!fileName.isEmpty()) {
                part.write(fileName);
            } else {
                imageInDB = d.getImage();
            }

            this.plantillaJDBC.update(
                    "INSERT INTO tienda_producto (cod_prod, producto,descripcion,precio,stock,"
                    + "estado,cod_cat_id, cod_prov_id, image, destacado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    cod_prod, d.getProducto(), d.getDescripcion(), d.getPrecio(), d.getStock(), d.getEstado(),
                    d.getCod_cat_id(), d.getCod_prov_id(), imageInDB, d.getDestacado()
            );
            return new ModelAndView("redirect:/admin-productos.htm");
        }
    }
    
    private String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=")+2, s.length()-1);
            }
        }
        return "";
    }
    
    @RequestMapping(value = "eliminar-producto", method = RequestMethod.GET)
    public ModelAndView eliminar_producto(@ModelAttribute("productos") productoDTO d,
            HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.plantillaJDBC.update("DELETE FROM tienda_producto WHERE "
                + "cod_prod=?", id);
        return new ModelAndView("redirect:/admin-productos.htm");
    }
     
    @RequestMapping(value = "editar-producto", method = RequestMethod.GET)
    public ModelAndView editar_producto(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("editar-producto");
        List cat = this.listaCategorias();
        mav.addObject("cat", cat);
        mav = this.añadirUsuarioMVC(mav);
        String sql = "SELECT * FROM tienda_proveedor";
        List proveedores = this.plantillaJDBC.queryForList(sql);
        mav.addObject("proveedores", proveedores);
        
        String id = request.getParameter("id");
        productoDTO productos = this.seleccionarProducto(id);
        mav.addObject("productos", new productoDTO(id, productos.getProducto(), productos.getDescripcion(),
        productos.getPrecio(), productos.getStock(), productos.getEstado(), productos.getCod_cat_id(),
        productos.getCod_prov_id(), productos.getImage(), productos.getDestacado()));
        mav.setViewName("editar-producto");
        return mav;
    }
    
    @RequestMapping(value = "editar-producto", method = RequestMethod.POST)
    public ModelAndView editar_producto(
            HttpServletRequest request, @Valid @ModelAttribute("productos") productoDTO d,
            BindingResult rpta
    ) throws IOException, ServletException{
        if(rpta.hasErrors()){
            ModelAndView mav = new ModelAndView("editar-producto");
            List cat = this.listaCategorias();
            mav.addObject("cat", cat);
            mav = this.añadirUsuarioMVC(mav);
            String sql = "SELECT * FROM tienda_proveedor";
            List proveedores = this.plantillaJDBC.queryForList(sql);
            mav.addObject("proveedores", proveedores);
            return mav;
        } else {
        String id = request.getParameter("id");
        Part part = request.getPart("file");
        String fileName = extractFileName(part);
        String imageInDB = SAVE_DIR_PROD + File.separator + fileName;
        if(!fileName.isEmpty()){
            part.write(fileName);
        } else {
            imageInDB = d.getImage();
        }
        this.plantillaJDBC.update(
                "UPDATE tienda_producto SET producto=?, descripcion=?, precio=?, stock=?,"
                + "estado=?, cod_cat_id=?, cod_prov_id=?, image=?, destacado=? WHERE cod_prod=?",
                d.getProducto(), d.getDescripcion(), d.getPrecio(), d.getStock(), d.getEstado(),
                d.getCod_cat_id(), d.getCod_prov_id(), imageInDB, d.getDestacado(), id
        );
        return new ModelAndView("redirect:/admin-productos.htm");
        }
    }
    
    @RequestMapping(value = "admin-compras")
    public ModelAndView admin_compras(){
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc = this.añadirUsuarioMVC(mvc);

        String sql = "SELECT * FROM tienda_compra";
        List compras = this.plantillaJDBC.queryForList(sql);

        mvc.addObject("compras", compras);

        mvc.setViewName("admin-compras");

        return mvc;
    }
    @RequestMapping(value = "admin-compras-detalles")
    public ModelAndView admin_compras_detalles(HttpServletRequest request){
        ModelAndView mvc = new ModelAndView();
        List cat = this.listaCategorias();
        mvc.addObject("cat", cat);
        mvc = this.añadirUsuarioMVC(mvc);
        
        String id = request.getParameter("id");

        String sql = "SELECT * FROM tienda_compra_detalles WHERE cod_compra="+id;
        List compras = this.plantillaJDBC.queryForList(sql);

        String sql2 = "SELECT * FROM tienda_producto";
        List productos = this.plantillaJDBC.queryForList(sql2);

        mvc.addObject("compras", compras);
        mvc.addObject("productos", productos);

        mvc.setViewName("admin-compras-detalles");

        return mvc;
    }
}
