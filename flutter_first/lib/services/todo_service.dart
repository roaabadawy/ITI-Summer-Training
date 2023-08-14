import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first/models/todo_model.dart';

class todoService{
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TodoModel>> gettodo() async {
    List<TodoModel> todoList = [];
    final dio = Dio();

    final response = await Dio().get(url);
    print(response);

    var data = response.data;
    data.forEach((element) {
        TodoModel user = TodoModel.fromJson(element);
        todoList.add(user);
      });

    return todoList;

  }
}