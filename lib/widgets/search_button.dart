import 'package:flutter/material.dart';
import 'package:pajeet_yeeter/classes/directories.dart';
import 'package:pajeet_yeeter/widgets/directory_item.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          // delegate to customize the search bar
          delegate: CustomSearchDelegate(),
          // CustomSearchDelegate()
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var directories in Directories.directoryName) {
      if (directories.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(directories);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<int> matchIndex = [];
    for (int i = 0; i < Directories.directoryName.length; i++) {
      if (Directories.directoryName[i]
          .toLowerCase()
          .contains(query.toLowerCase())) {
        matchIndex.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchIndex.length,
      itemBuilder: (context, index) {
        return DirectoryItem(
          directoryName: Directories.directoryName[matchIndex[index]],
          directoryId: Directories.directoryId[matchIndex[index]],
          directoryType: Directories.directoryType[matchIndex[index]],
          parentDirectoryId: Directories.parentDirectoryId[matchIndex[index]],
        );
      },
    );
  }
}
