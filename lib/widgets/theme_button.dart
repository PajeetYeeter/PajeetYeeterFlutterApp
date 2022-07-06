import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../classes/theme_model.dart';
import '../service_locator.dart';
import '../services/local_storage_service.dart';

class ThemeButton extends ConsumerStatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ThemeButton> createState() => _ThemeIconState();
}

class _ThemeIconState extends ConsumerState<ThemeButton> {
  IconData themeIcon = locator<LocalStorageService>().darkTheme
      ? Icons.wb_sunny
      : Icons.nights_stay_outlined;

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
      icon: Icon(
        themeIcon,
        color: Colors.yellow[800],
      ),
      onPressed: () {
        setState(
          () {
            if (locator<LocalStorageService>().darkTheme) {
              locator<LocalStorageService>().darkTheme = false;
              themeIcon = Icons.nights_stay_outlined;
            } else {
              locator<LocalStorageService>().darkTheme = true;
              themeIcon = Icons.wb_sunny;
            }
            ref.read(currentThemeProvider.state).state =
                !ref.watch(currentThemeProvider);
          },
        );
      },
    );
  }
}
