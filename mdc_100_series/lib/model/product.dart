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

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.location,
    required this.phoneNumber,
    required this.description,
  });

  final int id; // 호텔 ID
  final String name; // 호텔 이름
  final int rating; // 호텔 평점
  final String location; // 호텔 위치
  final String phoneNumber; // 호텔 번호
  final String description; // 호텔 설명

  String get assetName => 'assets/img/$id-0.jpg';

  @override
  String toString() => "$name (id=$id)";
}




// enum Category {
//   all,
//   accessories,
//   clothing,
//   home,
// }

// class Product {
//   const Product({
//     required this.category,
//     required this.id,
//     required this.isFeatured,
//     required this.name,
//     required this.price,
//   });

//   final Category category;
//   final int id;
//   final bool isFeatured;
//   final String name;
//   final int price;

//   String get assetName => '$id-0.jpg';
//   String get assetPackage => 'shrine_images';

//   @override
//   String toString() => "$name (id=$id)";
// }
