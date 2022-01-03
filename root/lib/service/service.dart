import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:root/const/const.dart';
import 'package:root/controller/user.dart';

class Service {
  static String url = 'http://127.0.0.1:5000/';
  static UserController userController = Get.find();

  static Future<bool> index() async {
    try {
      var response = await http.get(Uri.parse(url));
      print(jsonDecode(response.body));
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future getUsers() async {
    try {
      var response = await http.get(Uri.parse(url + 'all_user'));
      print(jsonDecode(response.body.toString()));
      if (response.statusCode == 200) {
        print('${response.body}');
        return jsonDecode(response.body);
      } else {
        print('${response.body}');
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Erro');
    }
  }

  static Future getDash(String type) async {
    try {
      var response = await http.post(Uri.parse(url + 'dashResidue'), body: {'type' : type});
      print(jsonDecode(response.body.toString()));
      if (response.statusCode == 200) {
        print('${response.body}');
        return jsonDecode(response.body);
      } else {
        print('${response.body}');
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Erro');
    }
  }

  static Future getUserResidue() async {
    try {
      var response = await http.post(Uri.parse(url + 'resideus'), body: {'number' : userController.user.number.toString()});
      print(jsonDecode(response.body.toString()));
      if (response.statusCode == 200) {
        print('${response.body}');
        return jsonDecode(response.body);
      } else {
        print('${response.body}');
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Erro');
    }
  }

  static Future deleteUser() async {
    try {
      var response = await http.post(Uri.parse(url + 'delete_user'), body: {'number' : userController.user.number.toString()});
      print(jsonDecode(response.body.toString()));
      if (response.statusCode == 200) {
        print('${response.body}');
        return jsonDecode(response.body);
      } else {
        print('${response.body}');
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Erro');
    }
  }

  static Future resetUser() async {
    try {
      var response = await http.post(Uri.parse(url + 'delete_all_date'), body: {'number' : userController.user.number.toString()});
      print(jsonDecode(response.body.toString()));
      if (response.statusCode == 200) {
        print('${response.body}');
        return jsonDecode(response.body);
      } else {
        print('${response.body}');
        print('${response.statusCode}');
      }
    } catch (e) {
      print('Erro');
    }
  }

  static Future register(String number, context) async {
    try {
      var response = await http
          .post(Uri.parse(url + 'register'), body: {'number': number});
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print('Usuario registado online');
        print('${response.body}');
      } else {
        print('${response.body}');
        print('${response.statusCode}');
        //throw Exception('Failed to register user online');
      }
    } catch (e) {
      Alert(context,
          title: 'Erro',
          contexto:
              'Erro numero invalido, clica em reiniciar, e recomeçe com um numero novo.\nO mixoo permite reciclares offline, por isso só podemos verificar o seu numero nos despeijos, reciclar e uma necessidade 😊.');
    }
  }
}
