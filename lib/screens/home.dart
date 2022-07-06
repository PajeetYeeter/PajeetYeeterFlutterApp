import 'package:pajeet_yeeter/classes/arguments.dart';
import 'package:flutter/material.dart';
import 'package:pajeet_yeeter/widgets/theme_button.dart';

import '../services/database_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/directory_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    HomeArguments? args =
        ModalRoute.of(context)!.settings.arguments as HomeArguments?;

    return Scaffold(
      drawer: const Drawer(child: ThemeButton()),
      appBar: CustomAppBar(
        title: args == null ? 'Home' : args.title!,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseService.getDirectories(args == null ? 0 : args.id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return DirectoryItem(
                  directoryId: snapshot.data![index]["DIRECTORY_ID"],
                  directoryName: snapshot.data![index]["DIRECTORY_NAME"],
                  parentDirectoryId: snapshot.data![index]
                      ["PARENT_DIRECTORY_ID"],
                  directoryType: snapshot.data![index]["DIRECTORY_TYPE"],
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
