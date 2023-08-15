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
  bool light = false;
  String changeTheme = "Light";

  @override
  void initState() {
    // _foundToDo = todosList;
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
    loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: _buildAppBar(),
      drawer: Drawer(
        backgroundColor: appBGColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: titleBGColor,
              //   ),
              //   child: Text('Task Wizard'),
              //
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png'),
                ),
                border: Border.all(
                  color: outlineColor,
                  width: 5,
                ),
                shape: BoxShape.circle,
                color: componentsColor,
                boxShadow: [
                  BoxShadow(
                    color: outlineColor,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                    blurRadius: 100.0,
                    spreadRadius: 10.0,
                  ),
                ],
              ),
              child: null,
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text('$changeTheme Mode'),
              onTap: () {
                light = !light;
                saveTheme();
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: appBGColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/avatar.jpeg'),
                ),
                border: Border.all(
                  color: outlineColor,
                  width: 5,
                ),
                shape: BoxShape.circle,
                color: componentsColor,
                boxShadow: [
                  BoxShadow(
                    color: outlineColor,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                    blurRadius: 100.0,
                    spreadRadius: 10.0,
                  ),
                ],
              ),
              child: null,
            ),
            const SizedBox(height: 20),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text("Username"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text("Settings"),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: titleBGColor,
              textColor: textColor,
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
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
                  color: appBGColor,
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
                        color: textColor),
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
                          color: componentsColor,
                          boxShadow: [
                            BoxShadow(
                              color: outlineColor,
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
                              hintStyle: TextStyle(color: hintColor),
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
                          backgroundColor: outlineColor,
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
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });

    saveData();
  }

  Future<void> _deleteToDoItem(String id) async {
    bool del = false;
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Do you want to delete?'),
        content: Text(
            'Task: ${todosList.firstWhere((element) => element.id == id).todoText}'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Confirm');
              del = true;
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              del = false;
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    if (del) {
      ToDo temp = ToDo(
        id: id,
        todoText: todosList.firstWhere((element) => element.id == id).todoText,
        isDone: todosList.firstWhere((element) => element.id == id).isDone,
      );
      setState(() {
        final snackBar = SnackBar(
          content: Text('Deleted ${temp.todoText}'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
              todosList.add(temp);
              todosList.firstWhere((element) => element.id == id).isDone =
                  temp.isDone;
              saveData();
              setState(() {});
            },
          ),
        );
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        todosList.removeWhere((item) => item.id == id);
        saveData();
      });
    }
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

  void loadTheme() {
    light = sharedPreferences.getBool("theme")!;
    setTheme();
    setState(() {});
  }

  void saveTheme() {
    sharedPreferences.setBool("theme", light);
    setTheme();
    setState(() {});
  }

  void setTheme() {
    if (light) {
      changeTheme = "Dark";
      titleBGColor = lightV;
      appBGColor = beige;
      componentsColor = lighterV;
      textColor = black;
      hintColor = white;
    } else {
      changeTheme = "Light";
      titleBGColor = blue;
      appBGColor = black;
      componentsColor = white;
      textColor = black;
      hintColor = grey;
    }
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: componentsColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: componentsColor,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: hintColor),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: titleBGColor,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Task Wizard",
        style:
            TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: black),
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.jpeg'),
              ),
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
    );
  }
}
