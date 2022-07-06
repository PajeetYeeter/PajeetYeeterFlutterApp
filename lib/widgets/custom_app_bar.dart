import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pajeet_yeeter/widgets/search_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize:
            const Size.fromHeight(kToolbarHeight), // here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(title),
          actions: const [SearchButton()],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
