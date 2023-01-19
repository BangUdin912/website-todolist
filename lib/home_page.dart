import 'package:flutter/material.dart';
import 'package:todolist_kegiatan_kampus/about_page.dart';
import 'package:todolist_kegiatan_kampus/colors.dart';
import 'package:todolist_kegiatan_kampus/todolist.dart';
import 'package:todolist_kegiatan_kampus/todolist_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todolist();
  List<ToDo> _foundtodolist = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundtodolist = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            'All TodoList',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        for (ToDo todoo in _foundtodolist.reversed)
                          TodolistItem(
                            todo: todoo,
                            ontodoChanged: _handletodoChange,
                            onDeleteItem: _deletetodolistItem,
                          ),
                      ],
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Tambahkan data baru',
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _addtodolistItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 40),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handletodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deletetodolistItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addtodolistItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todolistText: toDo));
    });
    _todoController.clear();
  }

  void _runfilter(String enteredKeyword) {
    List<ToDo> hasil = [];
    if (enteredKeyword.isEmpty) {
      hasil = todosList;
    } else {
      hasil = todosList
          .where((item) => item.todolistText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundtodolist = hasil;
    });
  }

  void _openPageAbout(BuildContext context, {bool, fullscreenDialog}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: fullscreenDialog,
          builder: (context) => AboutPage(),
        ));
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBlue,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('TodoList Tugas',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () => _openPageAbout(
            context,
            fullscreenDialog: true,
          ),
        ),
      ]),
    );
  }
}
