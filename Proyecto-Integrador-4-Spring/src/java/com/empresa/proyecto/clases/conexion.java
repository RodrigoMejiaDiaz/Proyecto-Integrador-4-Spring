/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.clases;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Rodrigo
 */
public class conexion {
    public DriverManagerDataSource conexion(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/proyecto_spring?allowPublicKeyRetrieval="
                + "true&useSSL=false&serverTimezone=UTC");
        dataSource.setUsername("root");
        dataSource.setPassword("DSTecsup2");
        return dataSource;
    }
}
