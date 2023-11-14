//Api call without Model.

// import 'package:dio/dio.dart';
// import 'package:dio_call_api/display_product.dart';
// import 'package:flutter/material.dart';

// class ApiPage extends StatelessWidget {
//   const ApiPage({super.key});

//   Future<List<dynamic>> fetchData() async {
//     Dio dio = Dio();
//     var response = await dio.get("https://fakestoreapi.com/products");
//     print(response.data.toString());

//     return response.data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: fetchData(),
//       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (BuildContext context, int index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DisplayProduct(
//                             productTitle: '${snapshot.data![index]['title']}',
//                             productCount:
//                                 '${snapshot.data![index]['rating']['count']}',
//                             productPrice: '${snapshot.data![index]['price']}',
//                             productRating:
//                                 '${snapshot.data![index]['rating']['rate']}',
//                             productDescription:
//                                 '${snapshot.data![index]['description']}'),
//                       ));
//                 },
//                 child: Card(
//                   child: ListTile(
//                     title: Text('${snapshot.data![index]['title']}'),
//                     subtitle: Text('${snapshot.data![index]['price']}'),
//                   ),
//                 ),
//               );
//             },
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// Api call with Model.

import 'package:dio/dio.dart';
import 'package:dio_call_api/display_product.dart';
import 'package:dio_call_api/product_model.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  Future<List<ProductModel>> fetchData() async {
    Dio dio = Dio();
    var response = await dio.get("https://fakestoreapi.com/products");

    final List<dynamic> responseData = response.data;

    final List<ProductModel> products =
        responseData.map((json) => ProductModel.fromJson(json)).toList();
    print(response.data.toString());

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DisplayProduct(productModel: snapshot.data![index]),
                      ));
                },
                child: Card(
                  child: ListTile(
                    title: Text('${snapshot.data![index].title}'),
                    subtitle: Text('${snapshot.data![index].price}'),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
