class Networks {
  String? name;
  int? id;
  String? logoPath;
  String? originCountry;

  Networks({this.name, this.id, this.logoPath, this.originCountry});

  factory Networks.fromJson(Map<String, dynamic> json) {
    return Networks(
      name: json['name'],
      id: json['id'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['origin_country'] = originCountry;
    return data;
  }
}
