class SignUpModel {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmpassword;

  SignUpModel({
    this.name,
    this.email,
    this.password,
    this.confirmpassword,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmpassword,
    };
  }
}
