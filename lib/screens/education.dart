import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/data/models/content_model.dart';
import 'package:mirror_energy/logic/product_controller.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/styles.dart';

class Education extends StatefulWidget {
  const Education({Key key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Text("Education")),
      body: body(
          context: context,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: controller.filterContent({"filter": "Education"}),
                    builder: (context, snap) {
                      if (snap.data == null) return Center(child: CircularProgressIndicator(),);
                      final List<ContentModel> content = snap.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: content.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      content[index].image == null
                                          ? Container()
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          content[index].image),
                                                      fit: BoxFit.cover)),
                                            ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 12),
                                          child: Html(
                                              data: content[index].content,
                                              style: {
                                                "p": Style(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                "li": Style(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                "a": Style(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              })),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              index==0 ?Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: color.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                    child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(text: 'Starships'
                                                ,style: TextStyle(color: Colors.red,fontSize: 22, fontWeight: FontWeight.bold )
                                            ),
                                            new TextSpan(text: " will take explorers to some of the billion of stars and trillion of "
                                            "planets in the Milky Way Galaxy.", style: style2),
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ):Container(),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
