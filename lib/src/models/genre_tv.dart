class GenreTv {
  int? id;
  String? name;

  GenreTv({this.id, this.name});

  factory GenreTv.fromJson(Map<String, dynamic> json) {
    return GenreTv(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
