import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/logic/payment_service.dart';
import 'package:mirror_energy/screens/home_page.dart';

import 'package:webview_flutter/webview_flutter.dart';


class PaypalPayment extends StatefulWidget {
  final Function onFinish;
  final amount;
  final title;

  PaypalPayment({this.onFinish, this.amount,  this.title});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String checkoutUrl;
  String executeUrl;
  String accessToken;
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL= 'cancel.example.com';



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
        await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: '+e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    });
  }


  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": widget.title,
        "quantity": 1,
        "price": widget.amount,
        "currency": defaultCurrency["currency"]
      }
    ];


    // checkout invoice details
    String totalAmount = widget.amount;
    String subTotalAmount = widget.amount;
    String shippingCost = '0';
    int shippingDiscountCost = 0;


    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount":
              ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping &&
                isEnableAddress)
              "shipping_address": {
                "recipient_name": "",
                "line1": "",
                "line2": "",
                "city": "",
                "country_code": "",
                "postal_code": "",
                "phone": "",
                "state": ""
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url": returnURL,
        "cancel_url": cancelURL
      }
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(key: _scaffoldKey,

        body: SafeArea(
          child: WebView(
            initialUrl: checkoutUrl,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.contains(returnURL)) {
                final uri = Uri.parse(request.url);
                final payerID = uri.queryParameters['PayerID'];
                if (payerID != null) {
                  services
                      .executePayment(executeUrl, payerID, accessToken)
                      .then((id) {
                    widget.onFinish(id);
                    allert(id.toString());
                  });
                } else {
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              }
              if (request.url.contains(cancelURL)) {
                Navigator.of(context).pop();
              }
              return NavigationDecision.navigate;
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
  Future<bool> allert(String msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Order successful !!",style: TextStyle(color: Colors.green,fontSize: 17,fontWeight: FontWeight.bold,fontFamily: 'fancy'),),
            title: Text('Transaction id $msg'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Get.to(HomePage());
                },
              ),

            ],
          );
        });
  }
}