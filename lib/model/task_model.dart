class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int dateTime;

  TaskModel({
    required this.title,
    required this.description,
    this.id = '',
    this.isDone = false,
    required this.dateTime,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            isDone: json['isDone'] as bool,
            dateTime: json['date'] as int);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'date': dateTime
    };
  }

  // Map<String, dynamic> updateToJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'isDone': isDone,
  //     'date': dateTime
  //   };
  // }
}
