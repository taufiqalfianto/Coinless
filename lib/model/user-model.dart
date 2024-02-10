class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? balance;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.balance,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        balance: json["balance"],
        token: json["token"],
      );

  UserModel copywith({
    String? name,
    String? email,
    String? phone,
    String? balance,
    String? token,
  }) =>
      UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        balance: balance,
        token: token ?? this.token,
      );
}
