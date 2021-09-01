import 'package:flutter/material.dart';
import 'package:sangamarket/src/model/data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: AppData.categoryList.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(AppData.categoryList[i].name),
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
        );
      },
    )
        // Column(
        //   children: [
        //     Container(
        //         height: MediaQuery.of(context).size.height - 210,
        //         child: _search()),
        //     ListView.builder(
        //         itemCount: AppData.categoryList.length,
        //         itemBuilder: (context, i) {
        //           return ListTile(
        //             title: Text(AppData.categoryList[i].name),
        //             leading: Icon(
        //               Icons.mode,
        //             ),
        //           );
        //         }),
        //   ],
        // ),
        );
  }
}
