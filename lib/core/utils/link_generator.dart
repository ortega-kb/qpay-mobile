Future<Uri> linkGenerator({
  required String id,
  required String amount,
  required String description,
  required String wallet,
}) async {
  return Uri.parse(
    "https://qpay.app/payment-link?id=$id&amount=$amount&description=$description&wallet=$wallet",
  );
}
