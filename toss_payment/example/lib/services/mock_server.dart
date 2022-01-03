import 'dart:io';

class MockServer {
  static Future startServer() async {
    HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    server.listen((request) async {
      final queries = request.uri.queryParameters;
      request.response
        ..statusCode = 200
        ..headers
            .set("Content-Type", 'text/html;charset=utf-8') //; charset=utf-8
        // ..write("<html><h1>You can now close this window</h1></html>");
        ..write(
          _html(
            paymentType: queries['pay_by']!,
            amount: int.parse(queries['amount']!),
            orderId: queries['order_id']!,
            orderName: "Toss Kim",
            customerName: "Toss Kim",
            successUrl: "https://test.com/success",
            faiUrl: "https://test.com/fail",
          ),
        );

      await request.response.close();
      // await server.close(force: true);
    });
  }
}

String _html({
  required String paymentType,
  int? amount,
  String? orderId,
  String? orderName,
  String? customerName,
  required String successUrl,
  required String faiUrl,
}) {
  return '''<html>
      <head>
   <script src="https://js.tosspayments.com/v1"></script>
   </head>
   <body>
   <script>
   var tossPayments = TossPayments('test_ck_OEP59LybZ8Bdv6A1JxkV6GYo7pRe')
   tossPayments.requestPayment('$paymentType', {
   amount: $amount,
   orderId: '$orderId',
   orderName: '$orderName',
   customerName: '$customerName',
   successUrl: window.location.origin + '/success',
   failUrl: window.location.origin + '/fail',
   })
   </script>
   </body>
   </html>
   ''';
}

String success = '''<html><h1>Success</h1></html>''';
String fail = '''<html><h1>Fail</h1></html>''';
