import 'json_data.dart';

class Directories {
  static List<int> directoryId = [];
  static List<String> directoryName = [];
  static List<int> parentDirectoryId = [];
  static List<int> directoryType = [];

  static populateData(DirectoryJson? directory, int parentId) {
    if (directory == null) return;

    directoryId.add(directory.id);
    directoryName.add(directory.name);
    directoryType.add(directory.type);
    parentDirectoryId.add(parentId);

    if (directory.children == null) return;

    int total = directory.children!.length;

    for (int i = 0; i < total - 1; i++) {
      populateData(directory.children![i], directory.id);
    }
    populateData(directory.children![total - 1], directory.id);
  }
}
