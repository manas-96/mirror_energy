import 'package:flutter/material.dart';
import 'package:mirror_energy/screens/components/slide_route.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:mirror_energy/screens/menu_page.dart';


appBar(context,title){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color,
    title: title,
    actions: [
      IconButton(
        icon: Icon(Icons.menu),color: Colors.white,
        onPressed: (){
          Navigator.push(context, SlideRoute(page: MenuPage()));
        },
      )
    ],
  );
}
