import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first/models/todo_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_first/services/todo_service.dart';
import 'package:flutter_first/views/cubit/todo_cubit.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(),
        child: BlocConsumer<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoError) {
            return Center(
              child: Text("Error"),
            );
          }
          return ListView.builder(
            itemCount: context.watch<TodoCubit>().todo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(context.watch<TodoCubit>().todo[index].title ?? "--"),

                trailing: Icon(Icons.check),
                leading: Text("${index + 1}"),
              );
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
