class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  ToDo.fromMap(Map map)
      : this.id = map["id"],
        this.todoText = map["todoText"],
        this.isDone = map["isDone"];

  Map toMap() {
    return {"id": this.id, "todoText": this.todoText, "isDone": this.isDone};
  }

  // static List<ToDo> todoList() {
  //   return [
  //     ToDo(id: '01', todoText: 'Study DSA', isDone: true),
  //     ToDo(id: '02', todoText: 'Work on todo app', isDone: true),
  //     ToDo(
  //       id: '03',
  //       todoText: 'Check Emails',
  //     ),
  //     ToDo(
  //       id: '04',
  //       todoText: 'Prepare for test',
  //     ),
  //     ToDo(
  //       id: '05',
  //       todoText: 'Watch Shutter Island',
  //     ),
  //     ToDo(
  //       id: '06',
  //       todoText: 'Complete EGD assignment',
  //     ),
  //   ];
  // }
}
