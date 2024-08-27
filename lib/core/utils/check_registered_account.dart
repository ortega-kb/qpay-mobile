bool checkRegisteredAccount(Map<String, dynamic> json) {
  return (json['identities'] as List).isEmpty ? true: false;
}