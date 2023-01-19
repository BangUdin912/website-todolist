import 'package:flutter/material.dart';
import 'package:todolist_kegiatan_kampus/colors.dart';
import 'package:todolist_kegiatan_kampus/todolist.dart';

class TodolistItem extends StatelessWidget {
  final ToDo todo;
  final ontodoChanged;
  final onDeleteItem;

  const TodolistItem(
      {Key? key,
      required this.todo,
      required this.ontodoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('klik Todolist Item');
          ontodoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todolistText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 40,
          width: 30,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 15,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('klik icon hapus');
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
