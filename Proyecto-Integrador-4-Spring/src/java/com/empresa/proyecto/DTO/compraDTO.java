/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DTO;

import java.util.Date;


/**
 *
 * @author Rodrigo
 */
public class compraDTO {
    
    private String cod_compra;
    private int total;
    private String cod_user;
    private Date fecha_compra;

    public String getCod_compra() {
        return cod_compra;
    }

    public void setCod_compra(String cod_compra) {
        this.cod_compra = cod_compra;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getCod_user() {
        return cod_user;
    }

    public void setCod_user(String cod_user) {
        this.cod_user = cod_user;
    }

    public Date getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(Date fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public compraDTO(String cod_compra, int total, String cod_user, Date fecha_compra) {
        this.cod_compra = cod_compra;
        this.total = total;
        this.cod_user = cod_user;
        this.fecha_compra = fecha_compra;
    }
    
    public compraDTO() {
        this.cod_compra = cod_compra;
        this.total = total;
        this.cod_user = cod_user;
        this.fecha_compra = fecha_compra;
    }
    
}
