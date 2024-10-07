// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selectedView = <bool>[true, false];

  List<Product> products = ProductsRepository.loadProducts(Category.all);

  List<Widget> _buildCards(BuildContext context) {
    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // ListView용 카드 빌더 (AspectRatio 제거)
  List<Widget> _buildListCards(BuildContext context) {
    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
              height: 100.0, // ListView에서는 고정된 높이를 설정
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
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
        title: const Text('Menu'), // 제목
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
              print('Filter button');
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
                  Navigator.pop(context); // 드로어 닫기
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
                  Navigator.pop(context); // 드로어 닫기
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
                  Navigator.pop(context); // 드로어 닫기
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
          Expanded(
            // 토글에 따라 GridView 또는 ListView 표시
            child: _selectedView[0]
                ? GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16.0),
                    childAspectRatio: 8.0 / 9.0,
                    children: _buildCards(context),
                  )
                : ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: _buildListCards(context),
                  ),
          ),
        ],
      ),
      // 키보드의 영향으로 화면이 변경되지 않음
      resizeToAvoidBottomInset: false,
    );
  }
}
