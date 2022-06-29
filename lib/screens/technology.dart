import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/logic/product_controller.dart';

import 'components/app_bar.dart';
import 'components/body.dart';
import 'components/content.dart';


class Technology extends StatefulWidget {
  final title;
  const Technology({Key key, this.title}) : super(key: key);

  @override
  _TechnologyState createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Text(widget.title=="News"?"Articles":widget.title)),
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
                    future: controller.filterContent({"filter": widget.title}),
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
