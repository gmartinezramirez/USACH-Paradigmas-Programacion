package org.usach.template.TDA;

public class User {

    private String username;
    private String password;
    private Boolean isLogged;

    public User(String username, String password, Boolean isLogged) {
        this.username = username;
        this.password = password;
        this.isLogged = isLogged;
    }
}
