import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:mirror_energy/data/api_response.dart';
import 'package:mirror_energy/logic/product_controller.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/product.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:get/get.dart';

class Merchandise extends StatefulWidget {
  const Merchandise({Key key}) : super(key: key);

  @override
  _MerchandiseState createState() => _MerchandiseState();
}

class _MerchandiseState extends State<Merchandise> {
  ProductController controller = Get.put(ProductController());
  List content=[];
  getData()async{
    final result = await ApiResponse().filterContent({"filter": "Merchandise"});
    if(result!="failed"){
      for(int i=0;i<result.length;i++){
        setState(() {
          content.add(result[i]);
        });
      }

    }
  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Text("Merchandise")),
      body: body(
        context: context,
        child: content.length==0?Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text(content[0]["title"],
                  style: style1,
                ),
                SizedBox(height: 10,),

                Html(
                  data: content[0]["content"],
                  style: {
                    "p": Style(color: Colors.white, fontWeight: FontWeight.w400)
                  },
                ),
                SizedBox(height: 20,),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8,
                      crossAxisCount: 1,
                    childAspectRatio: 1.7

                  ),
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(content[4]["image"]),fit: BoxFit.fill
                          )
                      ),
                    );
                  },
                ),
                //SizedBox(height: 20,),

                FutureBuilder(
                  future: controller.getProduct(),
                  builder: (context,snap){
                    if(snap.data==null) return CircularProgressIndicator();
                    return Products(product: snap.data,);
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
