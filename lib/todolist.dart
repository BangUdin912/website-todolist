import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todolistText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todolistText,
    this.isDone = false,
  });

  static List<ToDo> todolist() {
    return [
      ToDo(
        id: '01',
        todolistText: 'Tugas Besar PPB',
      ),
      ToDo(
        id: '02',
        todolistText: 'Tugas Besar ERP',
      ),
      ToDo(
        id: '03',
        todolistText: 'Tugas Besar DPW',
      ),
      ToDo(
        id: '04',
        todolistText: 'Tugas Besar BDL',
      ),
    ];
  }
}
