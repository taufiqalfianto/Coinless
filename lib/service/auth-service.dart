import 'dart:convert';

import 'package:coinless/model/login-model.dart';
import 'package:coinless/model/sign-up.dart';
import 'package:coinless/model/user-model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:coinless/shared/shared-values.dart';

class AuthService {
  Future<UserModel> login(LoginModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.tojson(),
      );
      print(response.body);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        user = user.copywith(token: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  Future<UserModel> register(SignUpModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.tojson(),
      );
      print(response.body);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        user = user.copywith(token: data.password);

        await storeCredentials(user);

        return user;
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentials(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'token', value: user.token);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginModel> getCredentialLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final LoginModel data = LoginModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> gettoken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? values = await storage.read(key: 'token');

    if (values != null) {
      token = 'Bearer ' + values;
    }

    return token;
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
