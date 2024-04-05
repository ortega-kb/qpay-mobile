enum Currency {
  CDF(value: "CDF"),
  USD(value: "USD");

  const Currency({required this.value});
  final String value;
}
