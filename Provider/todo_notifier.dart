import 'package:api/models/todo.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class todoNotifier with ChangeNotifier{
List<Todo> todolist=[];
List<Todo> get getTodos => todolist;
addTodos(Todo todo){
  todolist.add(todo);
  notifyListeners();

}
removeTodo (int index){
  todolist.removeAt(index);
  notifyListeners();
}
toggleIsDone(int index){
  todolist[index].isDone=!todolist[index].isDone;
  notifyListeners();
}
}