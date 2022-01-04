import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toss_payment/extensions/uri_extendsion.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Payment 웹화면.
class PaymentWebView extends StatefulWidget {
  final String? title;
  final Uri paymentRequestUrl;
  final Function(String url)? onPageStarted;
  final Function(String url)? onPageFinished;

  const PaymentWebView({
    Key? key,
    this.title,
    this.onPageStarted,
    this.onPageFinished,
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
        onPageStarted: widget.onPageStarted,
        onPageFinished: widget.onPageFinished,
        navigationDelegate: (request) async {
          Uri uri = Uri.parse(request.url);
          if (uri.scheme == 'http' ||
              uri.scheme == 'https' ||
              uri.scheme == 'about') {
            return NavigationDecision.navigate;
          }

          dev.log("NavigationDecision = ${request.url}",
              name: "WebView.navigationDelegate");

          String launchUrl = request.url;

          if (Platform.isAndroid) {
            Uri tossPayment = UriExtension.fromToss(request.url);
            launchUrl = tossPayment.toString();
          }

          launch(launchUrl);

          return NavigationDecision.prevent;
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
