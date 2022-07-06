import 'package:pajeet_yeeter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'classes/theme_model.dart';
import 'screens/home.dart';
import 'service_locator.dart';
import 'classes/directories.dart';
import 'constants/directory_structure.dart';
// import 'services/check_updates.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator().then(
    (value) => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    for (var folders in directoryStructure) {
      Directories.populateData(folders, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ref.watch(currentThemeProvider) ? darkTheme : lightTheme,
      title: 'Pajeet Yeeter',
      home: const MyHomePage(),
      routes: routes,
    );
  }
}
