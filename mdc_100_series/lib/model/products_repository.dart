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

import './product.dart';

class ProductsRepository {
  static List<Product> loadProducts() {
    const allProducts = <Product>[
      Product(
        id: 0,
        name: 'Lotte Hotel',
        rating: 5,
        location: 'Seoul, South Korea, 30 Eulji-ro, Jung-gu',
        phoneNumber: '+82 2-771-1000',
        description:
            'Luxury hotel with stunning city views and top-notch services.',
      ),
      Product(
        id: 1,
        name: 'Shilla Hotel',
        rating: 3,
        location: 'Seoul, South Korea, 202 Jangchungdan-ro, Jung-gu',
        phoneNumber: '+82 2-2233-3131',
        description:
            'Elegant hotel known for its traditional Korean hospitality.',
      ),
      Product(
        id: 2,
        name: 'Westin Chosun Hotel',
        rating: 2,
        location: 'Seoul, South Korea, 106 Sogong-ro, Jung-gu',
        phoneNumber: '+82 2-771-0500',
        description: 'A blend of modern luxury and traditional charm.',
      ),
      Product(
        id: 3,
        name: 'Park Hyatt',
        rating: 4,
        location: 'Busan, South Korea, 51 Marine City 1-ro, Haeundae-gu',
        phoneNumber: '+82 51-747-1234',
        description: 'Sleek and stylish, located in the heart of the city.',
      ),
      Product(
        id: 4,
        name: 'Haeundae Grand Hotel',
        rating: 3,
        location: 'Busan, South Korea, 1405-2 Haeundaehaebyeon-ro, Haeundae-gu',
        phoneNumber: '+82 51-742-2100',
        description:
            'Beachfront hotel with spacious rooms and great amenities.',
      ),
      Product(
        id: 5,
        name: 'Hilton Namhae Resort',
        rating: 3,
        location: 'Namhae, South Korea, 1170-1 Namhae-eup, Namhae-gun',
        phoneNumber: '+82 55-860-3000',
        description:
            'Resort with beautiful ocean views and family-friendly activities.',
      ),
      Product(
        id: 6,
        name: 'Hotel Interburgo',
        rating: 2,
        location: 'Daegu, South Korea, 218-2 Daegu-ro, Dalseo-gu',
        phoneNumber: '+82 53-620-1234',
        description: 'Comfortable hotel located near major attractions.',
      ),
      Product(
        id: 7,
        name: 'Grand Hyatt',
        rating: 3,
        location: 'Incheon, South Korea, 2880-1, 7th Ave, Yeonsu-gu',
        phoneNumber: '+82 32-745-1234',
        description:
            'Modern hotel with luxurious amenities and stunning views.',
      ),
      Product(
        id: 8,
        name: 'Hanwha Resort Seorak Sorano',
        rating: 1,
        location: 'Sokcho, South Korea, 1448 Seoraksan-ro, Sokcho-si',
        phoneNumber: '+82 33-636-0700',
        description:
            'Family-friendly resort located near Seoraksan National Park.',
      ),
      Product(
        id: 9,
        name: 'Hyatt Regency',
        rating: 5,
        location: 'Jeju Island, South Korea, 3039-4 Saekdal-dong, Seogwipo-si',
        phoneNumber: '+82 64-733-1234',
        description:
            'Luxury resort with beachfront access and excellent dining.',
      ),
      Product(
        id: 10,
        name: 'Hotel Dragon City',
        rating: 4,
        location: 'Seoul, South Korea, 95, Cheonggyecheon-ro, Yongsan-gu',
        phoneNumber: '+82 2-2223-1234',
        description: 'Contemporary hotel with a variety of dining options.',
      ),
      Product(
        id: 11,
        name: 'Ramada Encore Sindorim',
        rating: 2,
        location: 'Seoul, South Korea, 3-3 Sindorim-dong, Guro-gu',
        phoneNumber: '+82 2-2020-1234',
        description: 'Budget-friendly hotel close to public transport.',
      ),
      Product(
        id: 12,
        name: 'Ace Hotel',
        rating: 4,
        location: 'Seoul, South Korea, 151 Dongguk-ro, Jung-gu',
        phoneNumber: '+82 2-775-1515',
        description: 'Stylish hotel with modern design and great amenities.',
      ),
      Product(
        id: 13,
        name: 'Lotte Hotel',
        rating: 4,
        location: 'Busan, South Korea, 772 Haeundaehaebyeon-ro, Haeundae-gu',
        phoneNumber: '+82 51-740-1234',
        description: 'Luxury accommodation with breathtaking ocean views.',
      ),
      Product(
        id: 14,
        name: 'Hilton',
        rating: 5,
        location: 'Gwangju, South Korea, 77 Sangmu-ro 5-gil, Seo-gu',
        phoneNumber: '+82 62-607-1234',
        description: 'Luxurious hotel with elegant rooms and spa services.',
      ),
      Product(
        id: 15,
        name: 'Kensington Hotel',
        rating: 3,
        location: 'Jeju Island, South Korea, 222 Nuwemaru-ro, Seogwipo-si',
        phoneNumber: '+82 64-735-1234',
        description: 'Charming hotel located near major attractions.',
      ),
      Product(
        id: 16,
        name: 'Ramada Plaza',
        rating: 5,
        location: 'Jeju Island, South Korea, 66 Sammu-ro, Jeju-si',
        phoneNumber: '+82 64-730-1234',
        description: 'Elegant hotel with world-class facilities and services.',
      ),
      Product(
        id: 17,
        name: 'Paradise Hotel',
        rating: 4,
        location: 'Busan, South Korea, 1405 Haeundaehaebyeon-ro, Haeundae-gu',
        phoneNumber: '+82 51-742-2000',
        description: 'Luxury hotel with stunning ocean views and fine dining.',
      ),
      Product(
        id: 18,
        name: 'Lotte Resort',
        rating: 5,
        location: 'Sokcho, South Korea, 1491 Seoraksan-ro, Sokcho-si',
        phoneNumber: '+82 33-636-7000',
        description: 'Beautiful resort located near Seoraksan National Park.',
      ),
      Product(
        id: 19,
        name: 'Grand Intercontinental Parnas',
        rating: 5,
        location: 'Seoul, South Korea, 521 Teheran-ro, Gangnam-gu',
        phoneNumber: '+82 2-3456-1111',
        description: 'Luxury hotel with sophisticated ambiance and services.',
      ),
    ];

    return allProducts;
  }
}




// class ProductsRepository {
//   static List<Product> loadProducts(Category category) {
//     const allProducts = <Product>[
//       Product(
//         category: Category.accessories,
//         id: 0,
//         isFeatured: true,
//         name: 'Vagabond sack',
//         price: 120,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 1,
//         isFeatured: true,
//         name: 'Stella sunglasses',
//         price: 58,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 2,
//         isFeatured: false,
//         name: 'Whitney belt',
//         price: 35,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 3,
//         isFeatured: true,
//         name: 'Garden strand',
//         price: 98,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 4,
//         isFeatured: false,
//         name: 'Strut earrings',
//         price: 34,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 5,
//         isFeatured: false,
//         name: 'Varsity socks',
//         price: 12,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 6,
//         isFeatured: false,
//         name: 'Weave keyring',
//         price: 16,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 7,
//         isFeatured: true,
//         name: 'Gatsby hat',
//         price: 40,
//       ),
//       Product(
//         category: Category.accessories,
//         id: 8,
//         isFeatured: true,
//         name: 'Shrug bag',
//         price: 198,
//       ),
//       Product(
//         category: Category.home,
//         id: 9,
//         isFeatured: true,
//         name: 'Gilt desk trio',
//         price: 58,
//       ),
//       Product(
//         category: Category.home,
//         id: 10,
//         isFeatured: false,
//         name: 'Copper wire rack',
//         price: 18,
//       ),
//       Product(
//         category: Category.home,
//         id: 11,
//         isFeatured: false,
//         name: 'Soothe ceramic set',
//         price: 28,
//       ),
//       Product(
//         category: Category.home,
//         id: 12,
//         isFeatured: false,
//         name: 'Hurrahs tea set',
//         price: 34,
//       ),
//       Product(
//         category: Category.home,
//         id: 13,
//         isFeatured: true,
//         name: 'Blue stone mug',
//         price: 18,
//       ),
//       Product(
//         category: Category.home,
//         id: 14,
//         isFeatured: true,
//         name: 'Rainwater tray',
//         price: 27,
//       ),
//       Product(
//         category: Category.home,
//         id: 15,
//         isFeatured: true,
//         name: 'Chambray napkins',
//         price: 16,
//       ),
//       Product(
//         category: Category.home,
//         id: 16,
//         isFeatured: true,
//         name: 'Succulent planters',
//         price: 16,
//       ),
//       Product(
//         category: Category.home,
//         id: 17,
//         isFeatured: false,
//         name: 'Quartet table',
//         price: 175,
//       ),
//       Product(
//         category: Category.home,
//         id: 18,
//         isFeatured: true,
//         name: 'Kitchen quattro',
//         price: 129,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 19,
//         isFeatured: false,
//         name: 'Clay sweater',
//         price: 48,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 20,
//         isFeatured: false,
//         name: 'Sea tunic',
//         price: 45,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 21,
//         isFeatured: false,
//         name: 'Plaster tunic',
//         price: 38,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 22,
//         isFeatured: false,
//         name: 'White pinstripe shirt',
//         price: 70,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 23,
//         isFeatured: false,
//         name: 'Chambray shirt',
//         price: 70,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 24,
//         isFeatured: true,
//         name: 'Seabreeze sweater',
//         price: 60,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 25,
//         isFeatured: false,
//         name: 'Gentry jacket',
//         price: 178,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 26,
//         isFeatured: false,
//         name: 'Navy trousers',
//         price: 74,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 27,
//         isFeatured: true,
//         name: 'Walter henley (white)',
//         price: 38,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 28,
//         isFeatured: true,
//         name: 'Surf and perf shirt',
//         price: 48,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 29,
//         isFeatured: true,
//         name: 'Ginger scarf',
//         price: 98,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 30,
//         isFeatured: true,
//         name: 'Ramona crossover',
//         price: 68,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 31,
//         isFeatured: false,
//         name: 'Chambray shirt',
//         price: 38,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 32,
//         isFeatured: false,
//         name: 'Classic white collar',
//         price: 58,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 33,
//         isFeatured: true,
//         name: 'Cerise scallop tee',
//         price: 42,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 34,
//         isFeatured: false,
//         name: 'Shoulder rolls tee',
//         price: 27,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 35,
//         isFeatured: false,
//         name: 'Grey slouch tank',
//         price: 24,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 36,
//         isFeatured: false,
//         name: 'Sunshirt dress',
//         price: 58,
//       ),
//       Product(
//         category: Category.clothing,
//         id: 37,
//         isFeatured: true,
//         name: 'Fine lines tee',
//         price: 58,
//       ),
//     ];
//     if (category == Category.all) {
//       return allProducts;
//     } else {
//       return allProducts.where((Product p) {
//         return p.category == category;
//       }).toList();
//     }
//   }
// }