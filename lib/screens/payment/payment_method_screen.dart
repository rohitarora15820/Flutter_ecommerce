import 'dart:io';

import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PaymentMethodScreen extends StatelessWidget {
  static const String routeName = '/payment-method';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PaymentMethodScreen(),
    );
  }

  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Payment Selection'),
        // bottomNavigationBar: CustomNavBar(screen: routeName),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Platform.isIOS
                ? RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    onPressed: () {})
                : RawGooglePayButton(
                    type: GooglePayButtonType.pay, onPressed: () {})
            // GooglePayButton(onPressed: () {})
          ],
        ));
  }
}
