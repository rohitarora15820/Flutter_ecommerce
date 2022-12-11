import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(children: [
        Image.network(product.imageUrl,
            fit: BoxFit.cover, height: 80, width: 100),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Qty: $quantity',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ]),
      padding: EdgeInsets.only(bottom: 10),
    );
  }
}
