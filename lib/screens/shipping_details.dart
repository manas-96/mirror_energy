import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/buttons.dart';
import 'package:mirror_energy/screens/components/snacbar_items.dart';
import 'package:mirror_energy/screens/paypal_payment.dart';

import 'components/styles.dart';



class ShippingDetails extends StatefulWidget {
  final amount;
  final title;
  const ShippingDetails({Key key, this.amount, this.title}) : super(key: key);

  @override
  _ShippingDetailsState createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String name="";
  String address1="";
  String address2="";
  String city="";
  String zip="";
  String state="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      appBar: appBar(context, Text("Address")),
      body: body(
        context: context,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    name=val;
                  },
                  decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    address1=val;
                  },
                  decoration: InputDecoration(
                      hintText: "Address line 1",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    address2=val;
                  },
                  decoration: InputDecoration(
                      hintText: "Address line 2",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    city=val;
                  },
                  decoration: InputDecoration(
                      hintText: "City",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    state=val;
                  },
                  decoration: InputDecoration(
                      hintText: "State",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (val){
                    zip=val;
                  },
                  decoration: InputDecoration(
                      hintText: "Zip",
                      hintStyle: style3,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          )
                      )
                  ),
                ),
                SizedBox(height: 30,),
                button(
                  title: "Continue",
                  onPress: (){
                    if(name==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter your name"));
                    }
                    else if(address1==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter address line 1"));
                    }
                    else if(address2==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter address line 2"));
                    }
                    else if(city==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter city"));
                    }
                    else if(state==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter state"));
                    }
                    else if(zip==""){
                      _scaffoldKey.currentState.showSnackBar(SnackbarItems.errorToast("Please enter zip"));
                    }
                    else{
                      Get.to(PaypalPayment(
                        amount: widget.amount,
                        onFinish: (){
                          print("finish payment");
                        },
                        title: widget.title,

                      ));
                    }
                  }
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
