import 'package:flutter/material.dart';

import '../classes/arguments.dart';

class DirectoryItem extends StatelessWidget {
  const DirectoryItem({
    Key? key,
    this.uri,
    required this.directoryName,
    required this.directoryId,
    required this.parentDirectoryId,
    required this.directoryType,
  }) : super(key: key);
  final Uri? uri;
  final String directoryName;
  final int directoryId;
  final int parentDirectoryId;
  final int directoryType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String route = directoryType == 0 ? "/home" : "/detail";
        Navigator.pushNamed(context, route,
            arguments: HomeArguments(directoryName, directoryId));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 600,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  directoryType == 0
                      ? const Icon(Icons.folder)
                      : const Icon(Icons.description),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      directoryName,
                      textScaleFactor: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
