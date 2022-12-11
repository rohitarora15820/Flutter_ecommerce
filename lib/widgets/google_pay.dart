import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/models.dart';

class GooglePay extends StatelessWidget {
  final String total;
  final List<Product> products;
  const GooglePay({Key? key, required this.total, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onApplePayResult(result) {
      debugPrint(result);
    }

    var _paymentItems = products.map((product) {
      return PaymentItem(
        label: product.name,
        amount: product.price.toString(),
        type: PaymentItemType.item,
        status: PaymentItemStatus.final_price,
      );
    }).toList();

    _paymentItems.add(PaymentItem(
      label: 'Total',
      amount: total,
      type: PaymentItemType.total,
      status: PaymentItemStatus.final_price,
    ));

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
          paymentConfigurationAsset: 'payment_profile_google_pay.json',
          onPaymentResult: onApplePayResult,
          type: GooglePayButtonType.pay,
          margin: EdgeInsets.only(top: 10),
          // loadingIndicator: CircularProgressIndicator(),
          paymentItems: _paymentItems),
    );
  }
}
