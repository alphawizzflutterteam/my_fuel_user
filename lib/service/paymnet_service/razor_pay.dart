import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;

import 'package:razorpay_flutter/razorpay_flutter.dart';

String razorPayKey = "rzp_test_LCkZbZ1I6bhewi";
//String razorPaySecret = "Bb03yFC5dGa9lXTtLnF3qkXQ";

class RazorPayHelper {
  String amount;
  String? orderId;
  BuildContext context;
  ValueChanged onResult;
  Razorpay? _razorpay;
  RazorPayHelper(this.amount, this.context, this.onResult);
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  init() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    openCheckout();
  }

  void openCheckout() async {
    // await App.init();
    var options = {
      'key': razorPayKey,
      'amount': int.parse(amount) * 100,
      'name': 'My Fuel',
      "order_id": orderId,
      'description': "Suraksha #" + getRandomString(5),
      'external': {
        'wallets': ['paytm']
      },
      'prefill': {
        'name': 'Tanmay',
        'contact': '9998882220',
        'email': 'tanmay@gmail.com',
      },
      "notify": {"sms": true, "email": true},
      "reminder_enable": true,
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onResult(response.paymentId);
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    onResult("error");
    // setSnackbar("Payment Cancelled", context);
    //setSnackbar("ERROR: " + response.code.toString() + " - " + response.message.toString(), context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    onResult(response.walletName);
  }
}
