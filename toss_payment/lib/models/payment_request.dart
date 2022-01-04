class PaymentRequest {
  final String payBy;
  int? amount;
  String? orderId;
  String? orderName;
  String? customerName;

  // billing auth
  String? customerKey;

  // card direct
  String? flowMode;
  String? cardCompany;

  // virtual account
  int? validHours;
  Map<String, String>? cashReceipt;

  // account transfer
  String? bank;

  PaymentRequest({
    required this.payBy,
    this.amount,
    this.orderId,
    this.orderName,
    this.customerName,

    // billing auth
    this.customerKey,

    // card direct
    this.flowMode,
    this.cardCompany,

    // virtual account
    // this.validHours,
    // this.cashReceipt,
    // account transfer
    this.bank,
  });

  Map<String, dynamic> get json {
    Map<String, dynamic> ret = {};

    ret.addAll({"pay_by": payBy});

    if (amount != null) {
      ret.addAll({"amount": "$amount"});
    }

    if (orderId != null) {
      ret.addAll({"order_id": orderId});
    }
    if (orderName != null) {
      ret.addAll({"order_name": orderName});
    }
    if (customerName != null) {
      ret.addAll({"customer_name": customerName});
    }
    if (customerKey != null) {
      ret.addAll({"customer_key": customerKey});
    }
    if (flowMode != null) {
      ret.addAll({"flow_mode": flowMode});
    }
    if (cardCompany != null) {
      ret.addAll({"card_company": cardCompany});
    }
    // if (validHours != null) {
    //   ret.addAll({"valid_hours": "$validHours"});
    // }
    // if (cashReceipt != null) {
    //   ret.addAll({"cash_receipt": cashReceipt});
    // }

    if (bank != null) {
      ret.addAll({"bank": bank});
    }

    return ret;
  }

  factory PaymentRequest.card({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
  }) {
    return PaymentRequest(
      payBy: "카드",
      amount: amount,
      orderId: orderId,
      orderName: orderName,
      customerName: customerName,
    );
  }

  factory PaymentRequest.cardDirect({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
    required String cardCompany,
  }) {
    return PaymentRequest(
      payBy: "카드앱바로열기",
      amount: amount,
      orderId: orderId,
      orderName: orderName,
      customerName: customerName,
      flowMode: "DIRECT",
      cardCompany: cardCompany,
    );
  }

  factory PaymentRequest.billingAuth({
    required String customerKey,
  }) {
    return PaymentRequest(
      payBy: "카드자동결제",
      customerKey: customerKey,
    );
  }

  factory PaymentRequest.virtualAccount({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
    // int? validHours,
    // Map<String, String>? cashReceipt,
  }) {
    return PaymentRequest(
      payBy: "가상계좌",
      amount: amount,
      orderId: orderId,
      orderName: orderName,
      customerName: customerName,
      // validHours: validHours,
      // cashReceipt: cashReceipt,
    );
  }

  factory PaymentRequest.accountTransfer({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
    required String bank,
  }) {
    return PaymentRequest(
        payBy: "계좌이체",
        amount: amount,
        orderId: orderId,
        orderName: orderName,
        customerName: customerName,
        bank: bank);
  }

  factory PaymentRequest.phone({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
  }) {
    return PaymentRequest(
      payBy: "휴대폰",
      amount: amount,
      orderId: orderId,
      orderName: orderName,
      customerName: customerName,
    );
  }

  factory PaymentRequest.giftCard({
    required int amount,
    required String orderId,
    required String orderName,
    required String customerName,
  }) {
    return PaymentRequest(
      payBy: "도서문화상품권",
      amount: amount,
      orderId: orderId,
      orderName: orderName,
      customerName: customerName,
    );
  }

  static PaymentRequest? fromJson(json) {
    PaymentRequest? ret;
    switch (json['pay_by']) {
      case "카드":
        ret = PaymentRequest.card(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name']);
        break;
      case "카드자동결제":
        ret = PaymentRequest.billingAuth(customerKey: json['customer_key']);
        break;
      case "카드앱바로열기":
        ret = PaymentRequest.cardDirect(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name'],
            cardCompany: json['card_company']);
        break;
      case "가상계좌":
        ret = PaymentRequest.virtualAccount(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name']);
        break;
      case "계좌이체":
        ret = PaymentRequest.accountTransfer(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name'],
            bank: json['bank']);
        break;
      case "휴대폰":
        ret = PaymentRequest.phone(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name']);
        break;
      case "도서문화상품권":
        ret = PaymentRequest.giftCard(
            amount: int.parse(json['amount']),
            orderId: json['order_id'],
            orderName: json['order_name'],
            customerName: json['customer_name']);
        break;
    }
    return ret;
  }
}
