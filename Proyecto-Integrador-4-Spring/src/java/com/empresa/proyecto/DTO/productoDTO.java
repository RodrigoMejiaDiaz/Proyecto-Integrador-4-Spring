/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DTO;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Rodrigo
 */
public class productoDTO {
    private String cod_prod;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    private String producto;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    private String descripcion;
    
    @NotNull(message = "Este campo no puede ser nulo")
    private int precio;
    
    @NotNull(message = "Este campo no puede ser nulo")
    private int stock;
    
    private String estado;  
    private int cod_cat_id;
    private int cod_prov_id;
    private String image; 
    private String destacado;
    
    private String[] seleccionEstado = {"A", "X"};

    public productoDTO(String cod_prod, String producto, String descripcion, 
            int precio, int stock, String estado, int cod_cat_id, 
            int cod_prov_id, String image, String destacado) {
        this.cod_prod = cod_prod;
        this.producto = producto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.estado = estado;
        this.cod_cat_id = cod_cat_id;
        this.cod_prov_id = cod_prov_id;
        this.image = image;
        this.destacado = destacado;
    }

    public productoDTO() {
        this.cod_prod = cod_prod;
        this.producto = producto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.estado = estado;
        this.cod_cat_id = cod_cat_id;
        this.cod_prov_id = cod_prov_id;
        this.image = image;
        this.destacado = destacado;
    }

    public String getCod_prod() {
        return cod_prod;
    }

    public void setCod_prod(String cod_prod) {
        this.cod_prod = cod_prod;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCod_cat_id() {
        return cod_cat_id;
    }

    public void setCod_cat_id(int cod_cat_id) {
        this.cod_cat_id = cod_cat_id;
    }

    public int getCod_prov_id() {
        return cod_prov_id;
    }

    public void setCod_prov_id(int cod_prov_id) {
        this.cod_prov_id = cod_prov_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String[] getSeleccionEstado() {
        return seleccionEstado;
    }

    public void setSeleccionEstado(String[] seleccionEstado) {
        this.seleccionEstado = seleccionEstado;
    }

    public String getDestacado() {
        return destacado;
    }

    public void setDestacado(String destacado) {
        this.destacado = destacado;
    }
    
}
