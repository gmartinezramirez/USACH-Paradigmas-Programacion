package com.paradigmas.TDA;

public class Login {

    public boolean isLoginSucessful(String username, String password) {
        if(username.equals("gonzalo") && password.equals("123")) {
            return true;
        }
        return false;
    }
}
