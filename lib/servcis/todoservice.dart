import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taam_app/models/todomodel.dart';
class todoservice{
  String url ="https://jsonplaceholder.typicode.com/todos";
   Future<List<Todomodole>> getuserdata() async {
    List<Todomodole>todolist =[];
     final dio = Dio();
    final response = await dio.get(url);
    var data= response.data;
    // print(response.data);
    data.forEach((jsonElement) {
      Todomodole todo = Todomodole.fromJson(jsonElement);
      todolist.add(todo);
    });
     return todolist;
    }
}