import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model/product.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './main.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing the MyAppState using Provider
    final appState = Provider.of<MyAppState>(context);
    final favorites = appState.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Hotels'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // 아이콘 색상
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final product = favorites[index];

          return Dismissible(
            key: Key(product.name),
            onDismissed: (direction) {
              appState.removeFavorite(product); // 즐겨찾기에서 제거
            },
            background: Container(color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
