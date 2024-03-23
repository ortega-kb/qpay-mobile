/// User template containing all information about
/// our three Qpay account types (Individual, Corporate, and Public)
class UserModel {
  final String phoneNumber;

  final String? name;
  final String? postName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? city;
  final String? commune;
  final String? avenue;
  final String? number;
  final String? sectorOfActivity;
  final String? companyName;
  final String? rccm;
  final String? dateOfCreation;
  final String? profile;
  final String accountType;

  UserModel({
    required this.phoneNumber,
    this.name,
    this.postName,
    this.dateOfBirth,
    this.gender,
    this.city,
    this.commune,
    this.avenue,
    this.number,
    this.sectorOfActivity,
    this.companyName,
    this.rccm,
    this.dateOfCreation,
    this.profile,
    required this.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map["phoneNumber"],
      name: map["name"],
      postName: map["postName"],
      dateOfBirth: map["dateOfBirth"],
      gender: map["gender"],
      city: map["city"],
      commune: map["commune"],
      avenue: map["avenue"],
      number: map["number"],
      sectorOfActivity: map["sectorOfActivity"],
      companyName: map["companyName"],
      rccm: map["rccm"],
      dateOfCreation: map["dateOfCreation"],
      profile: map["profile"],
      accountType: map["accountType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "name": name,
        "postName": postName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "city": city,
        "commune": commune,
        "avenue": avenue,
        "number": number,
        "sectorOfActivity": sectorOfActivity,
        "companyName": companyName,
        "rccm": rccm,
        "dateOfCreation": dateOfCreation,
        "profile": profile,
        "accountType": accountType
      };
}
