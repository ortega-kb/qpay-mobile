class Operations {
  double transferAmount(double amount, int percent) {
    return (amount + (amount * (percent / 100)));
  }

  String concatPhoneNumber(String phoneNumber) {
    return "+243" + phoneNumber;
  }
}
