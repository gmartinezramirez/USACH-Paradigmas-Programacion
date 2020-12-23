package paradigmas.TDA;

public class Account {

  private static int id;  // TODO: revisar static
  private int accountNumber;
  private int currentMoney;
  private boolean isBlocked;

  public Account(int accountNumber, int currentMoney) {
    this.accountNumber = accountNumber;
    this.currentMoney = currentMoney;
    setId(++id);
  }

  public static int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public void setBlocked() {
    this.isBlocked = true;
  }

  public void setUnblocked() {
    this.isBlocked = false;
  }

  public int getCurrentMoney() {
    return currentMoney;
  }

  public void setCurrentMoney(int currentMoney) {
    this.currentMoney = currentMoney;
  }

  public boolean isBlocked() {
    return isBlocked;
  }

  @Override
  public String toString() {
    return "Account{"
        + "accountNumber="
        + accountNumber
        + ", currentMoney="
        + currentMoney
        + ", isBlocked="
        + isBlocked
        + '}';
  }
}
