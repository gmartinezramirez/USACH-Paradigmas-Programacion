package com.paradigmas.shoppingsystem.model;

public class User {

    private int id;
    private String username;
    private String password;
    private Boolean isLogged;

    public User(String username, String password) {
        this.isLogged = false;
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        if(isLogged) {
            return password;
         }
        return "No estas logueado, no te dare la password, ladronzuelo";
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getLogged() {
        return isLogged;
    }

    public void setLogged(Boolean logged) {
        isLogged = logged;
    }

    public void login() {
        isLogged = true;
    }

    public void logoff() {
        isLogged = false;
    }

}
