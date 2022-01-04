import 'dart:convert';
import 'dart:math';

import 'package:example/models/payment_request.dart';
import 'package:example/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final String payBy;
  final String title;
  final Product product;
  final Function(PaymentRequest request) onTap;

  const OrderWidget({
    Key? key,
    required this.payBy,
    required this.title,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(paymentRequest);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade700),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }

  PaymentRequest get paymentRequest {
    PaymentRequest? ret;
    switch (payBy) {
      case '카드':
        ret = PaymentRequest.card(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
        );
        break;
      case '카드자동결제':
        ret = PaymentRequest.billingAuth(
          customerKey: _generateCustomerKey(),
        );
        break;
      case '카드앱바로열기':
        ret = PaymentRequest.cardDirect(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
          cardCompany: '현대',
        );
        break;
      case '가상계좌':
        ret = PaymentRequest.virtualAccount(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
          // validHours: 24,
          // cashReceipt: {
          //   'type': '소득공제',
          // },
        );
        break;
      case '계좌이체':
        ret = PaymentRequest.accountTransfer(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
          bank: '우리',
        );
        break;
      case '휴대폰':
        ret = PaymentRequest.phone(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
        );
        break;
      case '도서문화상품권':
        ret = PaymentRequest.giftCard(
          amount: product.price,
          orderId: _generateOrderId(),
          orderName: product.name,
          customerName: _customerName,
        );
        break;
      default:
        break;
    }
    return ret!;
  }

  String _generateOrderId() {
    var ret = base64Encode([
      Random(DateTime.now().millisecond).nextInt(9),
      Random(DateTime.now().millisecond).nextInt(9),
      Random(DateTime.now().millisecond).nextInt(9),
      Random(DateTime.now().millisecond).nextInt(9),
      Random(DateTime.now().millisecond).nextInt(9),
      Random(DateTime.now().millisecond).nextInt(9),
    ]).toString();
    return ret;
  }

  String _generateCustomerKey() {
    // var ret = base64Encode([
    //   Random(DateTime.now().millisecond).nextInt(9),
    //   Random(DateTime.now().millisecond).nextInt(9),
    //   Random(DateTime.now().millisecond).nextInt(9),
    //   Random(DateTime.now().millisecond).nextInt(9),
    //   Random(DateTime.now().millisecond).nextInt(9),
    //   Random(DateTime.now().millisecond).nextInt(9),
    // ]).toString();
    return 'Y12n2V0fIRS_DUQyp6dsF';
  }

  String get _customerName => "레토스";
}
