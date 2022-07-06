// import 'dart:convert';
// import 'dart:io';

// import 'database_service.dart';

// void checkUpdates() async {
//   Map<String, dynamic> versionDetails =
//       await DatabaseService.dbVersionDetails();
//   int version = versionDetails["DB_VERSION"];
//   DateTime lastChecked = DateTime.parse(versionDetails["LAST_CHECKED"]);
//   if (DateTime.now().difference(lastChecked).inDays < 1) {
//     return;
//   }
//   int i = 1;
//   bool fileAvailable = true;
//   while (fileAvailable) {
//     try {
//       var request = await HttpClient().getUrl(Uri.parse(
//           'https://raw.githubusercontent.com/{}/{}/master/databaseUpdates/${version + i++}.txt'));
//       var response = await request.close();

//       await for (String contents in response.transform(const Utf8Decoder())) {
//         if (contents == '404: Not Found') {
//           DatabaseService.applyUpdates(
//               "UPDATE DATABASE_VERSION SET LAST_CHECKED = '${DateTime.now().toString()}';");
//           fileAvailable = false;
//         } else {
//           contents =
//               "${contents}UPDATE DATABASE_VERSION SET DB_VERSION = ${version + i - 1} AND LAST_CHECKED = '${DateTime.now().toString()}';";
//           DatabaseService.applyUpdates(contents);
//         }
//       }
//     } on Exception catch (_) {
//       DatabaseService.applyUpdates(
//           "UPDATE DATABASE_VERSION SET LAST_CHECKED = '${DateTime.now().toString()}';");
//       fileAvailable = false;
//       return;
//     }
//   }
// }
