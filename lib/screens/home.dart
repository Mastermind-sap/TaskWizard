import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences sharedPreferences;
  // var todosList = ToDo.todosList();
  List<ToDo> todosList = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    // _foundToDo = todosList;
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Container(
                  color: black,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'ToDo List',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: white),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (ToDo todoo in todosList.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                              hintText: 'Add a new todo item',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                      ),
                      child: ElevatedButton(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        onPressed: () {
                          _todoController.text.isNotEmpty
                              ? _addToDoItem(_todoController.text)
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'On Snap!',
                                    message:
                                        'ToDo item cannot be empty.\nPlease fill appropriate todo item!',
                                    contentType: ContentType.failure,
                                  ),
                                ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: violet,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      if (todo.isDone == true) {
        final snackbar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Congratulations!',
              message:
                  'On successfully completing your task : ${todo.todoText}',
              contentType: ContentType.success,
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });

    saveData();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
    saveData();
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    saveData();
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      todosList = results;
    });
  }

  void saveData() {
    List<String> spList =
        todosList.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList("list", spList);
    // print(spList);
  }

  void loadData() {
    List<String>? spList = sharedPreferences.getStringList("list");
    todosList = spList!.map((item) => ToDo.fromMap(json.decode(item))).toList();
    setState(() {});
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: grey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: titleBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: black,
          size: 30,
        ),
        const Text(
          "Task Wizard",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: black),
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpeg'),
          ),
        ),
      ]),
    );
  }
}
