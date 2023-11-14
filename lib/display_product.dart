// //Without Model.

// import 'package:flutter/material.dart';

// class DisplayProduct extends StatelessWidget {
//   String? productTitle;
//   String? productDescription;
//   String? productPrice;
//   String? productRating;
//   String? productCount;
//   String? productImage;

//   DisplayProduct(
//       {required this.productTitle,
//       required this.productCount,
//       required this.productPrice,
//       required this.productRating,
//       required this.productDescription});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Display Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Card(
//           margin: EdgeInsets.all(20),
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//             child: Column(
//               children: [
//                 Text(productTitle.toString()),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(productPrice.toString()),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(productDescription.toString()),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(productRating.toString()),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(productCount.toString()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//With Model.

import 'package:dio_call_api/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayProduct extends StatelessWidget {
  ProductModel productModel;

  // ignore: use_key_in_widget_constructors
  DisplayProduct({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Page"),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              children: [
                Text(productModel.title.toString()),
                const SizedBox(
                  height: 20,
                ),
                Text("${productModel.price} \$"),
                const SizedBox(
                  height: 20,
                ),
                Text(productModel.description.toString()),
                const SizedBox(
                  height: 20,
                ),
                Text(productModel.rating!.rate.toString()),
                const SizedBox(
                  height: 20,
                ),
                Text(productModel.rating!.count.toString()),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(productModel.image.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
