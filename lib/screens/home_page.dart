import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:mirror_energy/data/api_response.dart';
import 'package:mirror_energy/logic/product_controller.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/article.dart';
import 'package:mirror_energy/screens/components/banner_image.dart';
import 'package:mirror_energy/screens/components/blog.dart';
import 'package:mirror_energy/screens/components/product.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/screens/merchandise.dart';
import 'components/body.dart';
import 'components/content.dart';
import 'components/styles.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showText=false;
  ProductController controller = Get.put(ProductController());
  List content=[];
  String title;
  String description;
  getMerchandise()async{
    final result = await ApiResponse().filterContent({"filter": "Merchandise"});
    if(result!="failed"){
      for(int i=0;i<result.length;i++){
        setState(() {
          content.add(result[i]);
        });
      }
    }
    Future.delayed(Duration(seconds: 2),
          (){
            setState(() {
              showText=true;
            });
          }
      );
  }
  featureProduct()async{
    final result = await ApiResponse().filterContent({"filter": "Home"});
    if(result!="failed"){
      print(result[6]);
      for(int i=0;i<result.length;i++){
        if(result[i]["id"].toString()=="7"){
          setState(() {
            title=result[i]["title"];
            description=result[i]["content"];
          });
        }
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getMerchandise();
    featureProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,Image.asset("images/logo.png",height: 40,width: 80,)),
      body: body(
        context: context,
        child: ListView(

          children: [

            FutureBuilder(
              future: controller.filterContent({"filter": "Home"}),
              builder: (context,snap){
                if(snap.data==null) return Container();
                return BannerImage(
                  data: snap.data,
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FutureBuilder(
                    future: controller.filterContent({"filter": "Home"}),
                    builder: (context,snap){
                      if(snap.data==null) return Container();
                      final List data = snap.data;
                      print(data.length);
                      data.removeLast();
                      data.removeAt(0);
                      return Content(
                        content: data,
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  showText==true?Text(
                    title??"",
                    style: style2,
                  ):Container(),
                  SizedBox(
                    height: 10,
                  ),
                  showText==true?Html(
                    data:description??"",
                    style: {
                      "p":Style(color: Colors.white,fontWeight: FontWeight.w400)
                    },
                  ):Container(),
                  SizedBox(height: 15,),
                  if(content.length>0)
                   Image.network(content[4]["image"],fit: BoxFit.fill,height: 140,width: MediaQuery.of(context).size.width,),

                  FutureBuilder(
                    future: controller.getProduct(),
                    builder: (context,snap){
                      if(snap.data==null) return Center(child: CircularProgressIndicator(),);
                      return Products(product: snap.data,);
                    },
                  ),
                  SizedBox(height: 15,),
                  showText?Padding(
                    padding: const EdgeInsets.only(left:5.0,right: 5),
                    child: InkWell(
                      onTap: (){
                        Get.to(Merchandise());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(15),
                          color: color.withOpacity(0.6)
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("View all products",style: style2,),
                        ),
                      ),
                    ),
                  ):Container(),
                  SizedBox(height: 25,),

                  FutureBuilder(
                    future: controller.getArticles(),
                    builder: (context,snap){
                      if(snap.data==null) return Container();
                      return Column(
                        children: [
                          Center(
                            child: Text("Latest Article",style: style2,),
                          ),
                          Article(articleModel: snap.data,)
                        ],
                      );
                    },
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
