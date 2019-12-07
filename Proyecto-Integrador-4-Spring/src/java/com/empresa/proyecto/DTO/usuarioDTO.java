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
public class usuarioDTO {
    private String cod_user;
    private String username;
    private String password;
    private String correo;
    private String enabled;
    private String nombre;
    private String apellido;
    private String compania;
    private String telefono;
    private Date fec_nac;
    private String estado;
    private String cod_ciud_id;

    public usuarioDTO(String cod_user, String username, String password, String correo, String enabled, String nombre, String apellido, String compania, String telefono, Date fec_nac, String estado, String cod_ciud_id) {
        this.cod_user = cod_user;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.enabled = enabled;
        this.nombre = nombre;
        this.apellido = apellido;
        this.compania = compania;
        this.telefono = telefono;
        this.fec_nac = fec_nac;
        this.estado = estado;
        this.cod_ciud_id = cod_ciud_id;
    }
    
    public usuarioDTO() {
        this.cod_user = cod_user;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.enabled = enabled;
        this.nombre = nombre;
        this.apellido = apellido;
        this.compania = compania;
        this.telefono = telefono;
        this.fec_nac = fec_nac;
        this.estado = estado;
        this.cod_ciud_id = cod_ciud_id;
    }

    public String getCod_user() {
        return cod_user;
    }

    public void setCod_user(String cod_user) {
        this.cod_user = cod_user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCompania() {
        return compania;
    }

    public void setCompania(String compania) {
        this.compania = compania;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFec_nac() {
        return fec_nac;
    }

    public void setFec_nac(Date fec_nac) {
        this.fec_nac = fec_nac;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCod_ciud_id() {
        return cod_ciud_id;
    }

    public void setCod_ciud_id(String cod_ciud_id) {
        this.cod_ciud_id = cod_ciud_id;
    }
    
    
}
