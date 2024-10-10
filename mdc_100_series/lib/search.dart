import './main.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: Colors.white, // 제목 텍스트 색상
          fontSize: 25,
        ),
        centerTitle: true, // 제목 중간
      ),
    );
  }
}
