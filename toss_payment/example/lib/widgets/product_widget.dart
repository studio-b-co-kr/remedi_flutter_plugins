import 'package:flutter/cupertino.dart';
import 'package:toss_payment_example/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Name : ${product.name}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Price : ${product.price}',
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
