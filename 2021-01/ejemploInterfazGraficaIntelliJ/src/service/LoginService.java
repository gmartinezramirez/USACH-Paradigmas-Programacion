package service;

public class LoginService {

    public boolean doLogin(String username, String password) {
        if (username.equals("root") && password.equals("password")) {
            return true;
        }
        return false;
    }

}
