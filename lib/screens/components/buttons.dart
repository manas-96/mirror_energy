import 'package:flutter/material.dart';
import 'package:mirror_energy/screens/components/styles.dart';


button({onPress, String title}){
  return RaisedButton(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
          ),
    color: color.withOpacity(0.7),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
    ),
    onPressed: onPress,
  );
}
button2({onPress, String title}){
  return RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(width: 6,),
          Icon(Icons.send,color: color,size: 15,)
        ],
      )
    ),
    onPressed: onPress,
  );
}