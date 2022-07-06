import 'package:pajeet_yeeter/classes/directories.dart';
import 'package:pajeet_yeeter/constants/topics.dart';

class DatabaseService {
  static Future<List<Map<String, dynamic>>> getDirectories(int parentId) async {
    List<Map<String, dynamic>> directory = [];
    for (int i = 0; i < Directories.directoryId.length; i++) {
      if (parentId == Directories.parentDirectoryId[i]) {
        directory.add({
          "DIRECTORY_ID": Directories.directoryId[i],
          "DIRECTORY_NAME": Directories.directoryName[i],
          "PARENT_DIRECTORY_ID": Directories.parentDirectoryId[i],
          "DIRECTORY_TYPE": Directories.directoryType[i],
        });
      }
    }
    return directory;
  }

  static Future<List<Map<String, dynamic>>> getResponse(int directoryId) async {
    List<Map<String, dynamic>> response = [];
    for (var topic in topics) {
      if (topic["directoryId"] == directoryId) {
        response.add(topic);
      }
    }
    return response;
  }
}
