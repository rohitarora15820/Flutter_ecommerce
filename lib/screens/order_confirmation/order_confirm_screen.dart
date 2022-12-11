import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/ordersummaryproductcard.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order_confirmation';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmation(),
    );
  }

  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
          title: 'Order Confirmation',
        ),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 300,
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    top: 110,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 120,
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 220,
                    height: 100,
                    child: Center(
                      child: Text('Your order is confirmed!',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                  )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi John Doe',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Thank you for shopping with us!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Order Code #123456789',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    OrderSummary(),
                    SizedBox(height: 20),
                    Text(
                      'Order Details',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 5),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        OrderSummaryProductCard(
                          product: Product.products[0],
                          quantity: 1,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
