/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.DTO;

import java.util.Date;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Rodrigo
 */
public class usuarioDTO {
    private String cod_user;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    private String username;

    @NotEmpty(message = "Este campo no puede ser nulo")
    @Pattern(regexp = "^(?=.*\\d)(?=[a-zA-Z].*).{0,30}$", message = "La clave debe tener mínimo "
            + "una letra y un dígito numérico")
    private String password;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    @Email(message = "Debe ingresar una direccion de correo valida")
    private String correo;

    private String enabled;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    @Pattern(regexp = "^[a-zA-Z]+.$", message = "No se admiten dígitos numéricos")
    private String nombre;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    @Pattern(regexp = "^[a-zA-Z]+.$", message = "No se admiten dígitos numéricos")
    private String apellido;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    private String fec_nac;

    private String sexo;
    
    private String compania;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    @Pattern(regexp = "^[\\d]+.$", message = "Sólo se admiten dígitos numéricos")
    private String telefono;
    
    @NotEmpty(message = "Este campo no puede ser nulo")
    private String direccion;
    
    private String cod_ciud_id;
    
    private String estado;
    
    private String[] seleccionSexo = {"M", "F"};
    
    @AssertTrue(message = "Este campo no puede ser nulo") //Sirve para verificar si es True
    private boolean terms;

    public usuarioDTO() {
        this.cod_user = cod_user;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.enabled = enabled;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fec_nac = fec_nac;
        this.sexo = sexo;
        this.compania = compania;
        this.telefono = telefono;
        this.direccion = direccion;
        this.cod_ciud_id = cod_ciud_id;
        this.estado = estado;
        this.terms = terms;
    }
    
    public usuarioDTO(String cod_user, String username, String password, String correo, String enabled, String nombre, String apellido, String fec_nac, String sexo, String compania, String telefono, String direccion, String cod_ciud_id, String estado) {
        this.cod_user = cod_user;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.enabled = enabled;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fec_nac = fec_nac;
        this.sexo = sexo;
        this.compania = compania;
        this.telefono = telefono;
        this.direccion = direccion;
        this.cod_ciud_id = cod_ciud_id;
        this.estado = estado;
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

    public String getFec_nac() {
        return fec_nac;
    }

    public void setFec_nac(String fec_nac) {
        this.fec_nac = fec_nac;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCod_ciud_id() {
        return cod_ciud_id;
    }

    public void setCod_ciud_id(String cod_ciud_id) {
        this.cod_ciud_id = cod_ciud_id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String[] getSeleccionSexo() {
        return seleccionSexo;
    }

    public void setSeleccionSexo(String[] seleccionSexo) {
        this.seleccionSexo = seleccionSexo;
    }
    
    public boolean getTerms() {
        return terms;
    }

    public void setTerms(boolean terms) {
        this.terms = terms;
    }

}