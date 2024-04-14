class QrValidity {
  static bool qrValidity(String qrData) {
    List<String> qrDataSplit = qrData.split("-");
    if (qrDataSplit[0] == "qpay") {
      return true;
    } else
      return false;
  }
}
