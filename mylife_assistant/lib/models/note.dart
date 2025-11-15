class Note {
  int? id;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;

  Note({this.id, this.title, this.content, this.createdAt, this.updatedAt});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }
}
