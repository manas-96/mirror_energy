import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:mirror_energy/screens/contact_us.dart';
import 'package:mirror_energy/screens/conversion.dart';
import 'package:mirror_energy/screens/education.dart';
import 'package:mirror_energy/screens/home_page.dart';
import 'package:mirror_energy/screens/merchandise.dart';
import 'package:mirror_energy/screens/science.dart';
import 'package:mirror_energy/screens/technology.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color,
        automaticallyImplyLeading: false,
        title: Image.asset("images/logo.png",height: 40,width: 80,),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel_outlined,color: Colors.white,),
            onPressed: (){Navigator.pop(context);},
          )
        ],
      ),
      body: body(
        context: context,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: color.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.to(HomePage());
                },
                child: Text("Home",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Science());
                },
                child: Text("Science",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Technology(title: "Technology",));
                },
                child: Text("Technology",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Technology(title: "Economics"));
                },
                child: Text("Economics",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Conversion());
                },
                child: Text("Conversion",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Education());
                },
                child: Text("Education",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Merchandise());
                },
                child: Text("Merchandise",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(Technology(title: "News",));
                },
                child: Text("Articles",style: style2,),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.to(ContactUs());
                },
                child: Text("Contact",style: style2,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
