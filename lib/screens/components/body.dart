import 'package:flutter/material.dart';

body({context,child}){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.jpg"),fit: BoxFit.cover
        )
    ),
    child: child,
  );
}