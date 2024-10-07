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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // Replace this entire method
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102)
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
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

      // TODO: Add a grid view (102)
      body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context) // Changed code
          ),

      // TODO: Set resizeToAvoidBottomInset (101)
      // 키보드의 영향으로 화면이 변경되지 않음
      resizeToAvoidBottomInset: false,
    );
  }
}
