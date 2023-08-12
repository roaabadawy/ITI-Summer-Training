import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first/models/user_model.dart';

class UserService{
  String url = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserModel>> getUsers() async {
    List<UserModel> userList = [];
    final dio = Dio();

    final response = await Dio().get(url);
    print(response);

    var data = response.data;
    data.forEach((element) {
        UserModel user = UserModel.fromJson(element);
        userList.add(user);
      });

    return userList;

  }
}