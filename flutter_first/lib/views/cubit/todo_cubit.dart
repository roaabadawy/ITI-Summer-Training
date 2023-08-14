import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../models/todo_model.dart';
import '../../services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {

  List<TodoModel> todo = [];
  TodoCubit() : super(TodoInitial()){
    gettodo();
  }
  gettodo() async {
    try {
      emit(TodoLoading());
      todo = await todoService().gettodo();
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError());
    }

  }
}
