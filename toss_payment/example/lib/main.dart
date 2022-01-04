import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:toss_payment/feature/webview/payment_webview.dart';

import 'models/payment_request.dart';
import 'models/product.dart';
import 'services/mock_server.dart';
import 'widgets/order_widget.dart';
import 'widgets/product_widget.dart';

void main() async {
  /// 예시를 위해 만든 mock server 입니다.
  await MockServer.startServer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toss Payment Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Toss Payment Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Product _product = Product(price: 15000, name: '토스 티셔츠');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Center(
              child: ProductWidget(
                product: _product,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(4),
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              Widget ret = Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              );

              switch (index) {
                case 0:
                  ret = OrderWidget(
                    title: '카드',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드',
                  );
                  break;
                case 1:
                  ret = OrderWidget(
                    title: '카드 자동결제',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드자동결제',
                  );
                  break;
                case 2:
                  ret = OrderWidget(
                    title: '카드 앱 바로 열기',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '카드앱바로열기',
                  );
                  break;
                case 3:
                  ret = OrderWidget(
                    title: '가상계좌',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '가상계좌',
                  );
                  break;
                case 4:
                  ret = OrderWidget(
                    title: '계좌이체',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '계좌이체',
                  );
                  break;
                case 5:
                  ret = OrderWidget(
                    title: '휴대폰',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '휴대폰',
                  );
                  break;
                case 6:
                  ret = OrderWidget(
                    title: '도서문화상품권',
                    product: _product,
                    onTap: (request) {
                      _showPayment(context, request);
                    },
                    payBy: '도서문화상품권',
                  );
                  break;
              }
              return ret;
            }),
          ),
        ]),
      ),
    );
  }

  _showPayment(BuildContext context, PaymentRequest request) async {
    var ret = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        isDismissible: false,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.only(top: 110),
            child: PaymentWebView(
                title: _product.name, paymentRequestUrl: request.url),
          );
        });
    dev.log('ret = $ret', name: '_showPayment');
    // TODO check success or not.
  }
}

extension PaymentRequestExtension on PaymentRequest {
  Uri get url {
    // TODO 토스페이를 위해 만든 Web 주소를 넣어주세요. 아래는 예시입니다.
    return Uri.http("localhost:8080", "payment", json);
  }
}
