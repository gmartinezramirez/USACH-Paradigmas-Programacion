package com.paradigmas.TDA;

public class Client {

  private int id;
  private Account account;
  private String username;
  private String password;
  private boolean isActive;

  public Client(Account account, String username, String password) {
    this.account = account;
    this.username = username;
    this.password = password;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public Account getAccount() {
    return account;
  }

  public void setAccount(Account account) {
    this.account = account;
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
    if (this.isActive) {
      this.password = password;
    }
  }

  public boolean isActive() {
    return isActive;
  }

  public void setActive() {
    this.isActive = true;
  }

  public void setDeactivated() {
    this.isActive = false;
  }

  @Override
  public String toString() {
    return "Client{"
        + "id="
        + id
        + ", account="
        + account
        + ", username='"
        + username
        + '\''
        + ", password='"
        + password
        + '\''
        + ", isActive="
        + isActive
        + '}';
  }
}
