import 'package:pajeet_yeeter/screens/detail.dart';
import 'package:pajeet_yeeter/screens/home.dart';
import 'package:flutter/widgets.dart';

import 'screens/settings.dart';

Map<String, WidgetBuilder> routes = {
  '/home': (context) => const MyHomePage(),
  '/settings': (context) => const Settings(),
  '/detail': (context) => const Detail(),
};
