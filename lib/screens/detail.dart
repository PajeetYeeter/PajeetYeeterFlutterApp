import 'package:pajeet_yeeter/classes/arguments.dart';
import 'package:flutter/material.dart';

import '../services/database_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/theme_button.dart';
import '../widgets/twitter_view.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeArguments;

    return Scaffold(
      drawer: const Drawer(child: ThemeButton()),
      appBar: CustomAppBar(title: args.title!),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseService.getResponse(args.id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TwitterView(
                  responseText: snapshot.data![index]["responseText"],
                  responseMedias: snapshot.data![index]["responseMedia"],
                  mediaUrls: snapshot.data![index]["mediaUrls"],
                  mediaType: snapshot.data![index]["mediaType"],
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
