import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import './main.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);
    final favorites = appState.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipOval(
                  child: Container(
                    color: Colors.blue[100],
                    width: 150,
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/cat.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Seonghwan Sim'),
                Text('22000397'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('My Favorite Hotel List'),
              Expanded(
                child: ListView(
                  children: favorites.map((product) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          product.assetName,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
