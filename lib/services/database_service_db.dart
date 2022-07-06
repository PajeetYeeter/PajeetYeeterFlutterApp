// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseService {
//   static Future<Database> openDatabaseConnection() async {
//     var path = join(await getDatabasesPath(), "database.db");
//     // var exists = await databaseExists(path);

//     // if (!exists) {
//     try {
//       await Directory(dirname(path)).create(recursive: true);
//     } catch (_) {}
//     ByteData data = await rootBundle.load(join("assets", "database.db"));
//     List<int> bytes =
//         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     await File(path).writeAsBytes(bytes, flush: true);
//     // var oldPath = join(await getDatabasesPath(), "hanswehrV11.db");
//     // exists = await databaseExists(oldPath);
//     // if (exists) {
//     //   databaseFactory.deleteDatabase(oldPath);
//     // }
//     // }
//     Database db = await openDatabase(path);
//     return db;
//   }

//   static Future<Map<String, dynamic>> dbVersionDetails() async {
//     Database db = await openDatabaseConnection();
//     String query = 'SELECT DB_VERSION, LAST_CHECKED FROM DATABASE_VERSION';
//     List<Map<String, dynamic>> version = await db.rawQuery(query);
//     return version.first;
//   }

//   static void applyUpdates(String updateDBScript) async {
//     Database db = await openDatabaseConnection();

//     List<String> updateDBCommand = updateDBScript.split('\n');

//     await db.transaction(
//       (txn) async {
//         for (var command in updateDBCommand) {
//           txn.execute(command);
//         }
//       },
//     );
//   }

//   static Future<List<Map<String, dynamic>>> getDirectories(int parentId) async {
//     Database db = await openDatabaseConnection();
//     String query =
//         'SELECT  DIRECTORY_ID, DIRECTORY_NAME, PARENT_DIRECTORY_ID, DIRECTORY_TYPE FROM DIRECTORIES WHERE PARENT_DIRECTORY_ID = $parentId';
//     List<Map<String, dynamic>> directory = await db.rawQuery(query);
//     return directory;
//   }

//   static Future<List<Map<String, dynamic>>> getResponse(int directoryId) async {
//     Database db = await openDatabaseConnection();
//     String query =
//         'SELECT RESPONSE_TEXT, RESPONSE_PICS, PIC_URLS FROM TOPICS WHERE DIRECTORY_ID = $directoryId';
//     List<Map<String, dynamic>> response = await db.rawQuery(query);
//     return response;
//   }
// }
