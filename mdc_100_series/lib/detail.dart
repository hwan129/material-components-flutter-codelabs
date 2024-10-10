import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/product.dart';
import './main.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Product> favorites = [];

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    final appState = context.watch<MyAppState>();
    bool isFavorite = appState.isFavorite(product);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, // 아이콘 색상
        ),
        title: const Text('Detail'), // 제목
        titleTextStyle: TextStyle(
          color: Colors.white, // 제목 텍스트 색상
          fontSize: 25,
        ),
        centerTitle: true, // 제목 중간
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Hero(
                  tag: product.id,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onDoubleTap: () {
                        appState.toggleFavorite(product);
                      },
                      child: Image.asset(
                        product.assetName,
                        fit: BoxFit.cover,
                        width: double.infinity, // 좌우 꽉차게
                        height: 300,
                      ),
                    ),
                  )),
              Positioned(
                  right: 15,
                  top: 15,
                  child: IconButton(
                    onPressed: () {
                      appState.toggleFavorite(product);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(product.rating, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 30,
                        );
                      }),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          product.name,
                          textStyle: TextStyle(
                              fontSize: 30, // 글자 크기 조절
                              fontWeight: FontWeight.bold),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue[300],
                        ),
                        Text(product.location)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.blue[300],
                        ),
                        Text(product.phoneNumber)
                      ],
                    ),
                    Divider(
                      thickness: 1, // 두께
                      color: Colors.grey, // 색상
                      height: 20, // 높이
                    ),
                    Text(product.description)
                  ]))
        ],
      ),
    );
  }
}
