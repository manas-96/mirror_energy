import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/logic/product_controller.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/content.dart';

import 'components/article.dart';


class Science extends StatefulWidget {
  const Science({Key key}) : super(key: key);

  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  ProductController controller = Get.put(ProductController());
  getData()async{
    final result = await controller.filterContent({"filter": "Science"});
    setState(() {
      var temp = result[1];
      result[1]=result[0];
      result[0]=temp;
    });
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Text("Science")),
      body: body(
        context: context,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getData(),
                  builder: (context,snap){
                    if(snap.data==null) return CircularProgressIndicator();
                    return Content(content: snap.data,);
                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
