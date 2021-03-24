package com.paradigmas.shoppingsystem.model;

import java.util.List;

public class ShoppingSystem {

    List<User> users;

    public ShoppingSystem(List<User> users) {
        this.users = users;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        String message = "Shopping System \n";
        for (User user : users) {
            message += "Nombre usuario: " + user.getUsername() + "\n";
            message += "Password usuario: " + user.getPassword() + "\n";
        }
        return message;
    }
}
