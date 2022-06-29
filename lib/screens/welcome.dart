import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/screens/home_page.dart';

import 'components/body.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
        (){Get.to(HomePage());}
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(
        context: context,
        child: InkWell(
          onTap: (){

          },
          child: Center(
            child: Image.asset(
              'images/logo.png',
              width: 180,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
