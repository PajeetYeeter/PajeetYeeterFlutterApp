import 'dart:convert';

List<DirectoryJson> directoriesFromJson(String str) => List<DirectoryJson>.from(
    json.decode(str).map((x) => DirectoryJson.fromJson(x)));

String directoriesToJson(List<DirectoryJson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DirectoryJson {
  DirectoryJson({
    required this.id,
    required this.name,
    required this.type,
    this.children,
  });

  int id;
  String name;
  int type;
  List<DirectoryJson>? children;

  factory DirectoryJson.fromJson(Map<String, dynamic> json) => DirectoryJson(
        id: json["Id"],
        name: json["Name"],
        type: json["Type"],
        children: json["children"] == null
            ? null
            : List<DirectoryJson>.from(
                json["children"].map((x) => DirectoryJson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Type": type,
        "children": children == null
            ? null
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}
