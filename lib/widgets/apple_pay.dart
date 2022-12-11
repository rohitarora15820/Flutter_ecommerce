import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../models/models.dart';

class ApplePay extends StatelessWidget {
  final String total;
  final List<Product> products;
  const ApplePay({Key? key, required this.total, required this.products})
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
    //   PaymentItem(
    //     label: 'Total',
    //     amount: '99.99',
    //     status: PaymentItemStatus.final_price,
    //   ),
    // ];
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: ApplePayButton(
          paymentConfigurationAsset: 'payment_profile_apple_pay.json',
          onPaymentResult: onApplePayResult,
          style: ApplePayButtonStyle.white,
          type: ApplePayButtonType.inStore,
          margin: EdgeInsets.only(top: 10),
          loadingIndicator: CircularProgressIndicator(),
          paymentItems: _paymentItems),
    );
  }
}
