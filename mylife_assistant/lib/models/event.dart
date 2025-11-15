class Event {
  int? id;
  String? title;
  String? description;
  String? startTime;
  String? endTime;
  String? createdAt;

  Event({this.id, this.title, this.description, this.startTime, this.endTime, this.createdAt});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'createdAt': createdAt,
    };
    return map;
  }

  Event.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    createdAt = map['createdAt'];
  }
}
