import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'detail.dart';

final Uri _url = Uri.parse('https://www.handong.edu/');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selectedView = <bool>[true, false];

  List<Product> products = ProductsRepository.loadProducts();

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  List<Widget> _buildCards(BuildContext context) {
    if (products.isEmpty) {
      return const <Card>[];
    }

    // grid view
    if (_selectedView[0]) {
      return products.map((product) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            // Stack -> css의 position : absolute
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Hero(
                        tag: product.id,
                        child: Image.asset(
                          product.assetName,
                          fit: BoxFit.fitWidth,
                        ),
                      )),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Row(children: [
                              Expanded(
                                flex: 1, // 비율 맞추기
                                child: Container(),
                              ),
                              Expanded(
                                flex: 4, // 비율 맞추기
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(product.rating,
                                          (index) {
                                        return Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 12,
                                        );
                                      }),
                                    ),
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1, // 비율 맞추기
                                  child: Icon(
                                    Icons.location_pin,
                                    color: Colors.blue[300],
                                  ),
                                ),
                                Expanded(
                                  flex: 4, // 비율 맞추기
                                  child: Text(
                                    product.location,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Positioned(
                // css의 position:absolute
                right: 10,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Text(
                    "more",
                    style: TextStyle(fontSize: 11, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList();
    } else {
      // list view
      return products.map((product) {
        return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Hero(
                            tag: product.id,
                            child: Image.asset(
                              product.assetName,
                              // package: product.assetPackage,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100, // ListView에서는 고정된 높이를 설정
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(product.rating, (index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                );
                              }),
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              product.location,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  // css의 position:absolute
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(product: product),
                        ),
                      );
                    },
                    child: Text(
                      "more",
                      style: TextStyle(fontSize: 11, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ));
      }).toList();
    }
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    var orientation = MediaQuery.of(context).orientation; // 방향 감지
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, // 아이콘 색상
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // 햄버거 열기
              },
            );
          },
        ),
        title: const Text('Main'), // 제목
        titleTextStyle: TextStyle(
          color: Colors.white, // 제목 텍스트 색상
          fontSize: 25,
        ),
        centerTitle: true, // 제목 중간
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'language',
            ),
            onPressed: () {
              _launchUrl();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomLeft, // 왼쪽 아래로 정렬
                    child: Text(
                      'Pages',
                      style: TextStyle(
                          color: Colors.white, fontSize: 30), // 글씨 색상을 흰색으로 설정
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.blue[300],
                ),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.blue[300],
                ),
                title: Text('Search'),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.blue[300],
                ),
                title: Text('Favorite Hotel'),
                onTap: () {
                  Navigator.pushNamed(context, '/favorite');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.blue[300],
                ),
                title: Text('My Page'),
                onTap: () {
                  Navigator.pushNamed(context, '/mypage');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.blue[300],
                ),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context); // 드로어 닫기
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          // 토글 버튼 추가
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ToggleButtons(
                        isSelected: _selectedView,
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0;
                                buttonIndex < _selectedView.length;
                                buttonIndex++) {
                              if (buttonIndex == index) {
                                _selectedView[buttonIndex] = true;
                              } else {
                                _selectedView[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        children: <Widget>[
                          Icon(
                            Icons.grid_on,
                            color: _selectedView[0] ? Colors.blue : Colors.grey,
                          ), // GridView 아이콘
                          Icon(
                            Icons.list,
                            color: _selectedView[1] ? Colors.blue : Colors.grey,
                          ), // ListView 아이콘
                        ],
                      ),
                    ),
                  ])),
          Expanded(
            // 토글에 따라 GridView 또는 ListView 표시
            child: _selectedView[0]
                ? GridView.count(
                    // 세로는 2개, 가로는 3개
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    padding: const EdgeInsets.all(16.0),
                    childAspectRatio: 8.0 / 9.0,
                    children: _buildCards(context),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: _buildCards(context),
                  ),
          ),
        ],
      ),
      // 키보드의 영향으로 화면이 변경되지 않음
      resizeToAvoidBottomInset: false,
    );
  }
}
