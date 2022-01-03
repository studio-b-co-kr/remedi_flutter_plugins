import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String? title;
  final Uri paymentRequestUrl;

  const PaymentWebView({
    Key? key,
    this.title,
    required this.paymentRequestUrl,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title ?? "",
          style: TextStyle(color: Colors.indigo.shade50),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.close,
                color: Colors.indigo.shade50,
              ),
            ),
          )
        ],
      ),
      body: WebView(
        initialUrl: widget.paymentRequestUrl.toString(),
        onPageStarted: (url) {
          dev.log(url, name: "WebView");
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
