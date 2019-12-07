/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DTO;

/**
 *
 * @author Rodrigo
 */
public class itemDTO {
    
    private productoDTO producto;
    private int cantidad;
    private int subtotal;

    public productoDTO getProducto() {
        return producto;
    }

    public void setProducto(productoDTO producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
    
    
    public itemDTO(){
        
    }

    public itemDTO(productoDTO producto, int cantidad, int subtotal) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }
    
    
}
