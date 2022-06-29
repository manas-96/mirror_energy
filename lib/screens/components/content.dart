import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/data/models/content_model.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:mirror_energy/screens/science.dart';
import 'package:mirror_energy/screens/technology.dart';


class Content extends StatelessWidget {
  final List<ContentModel> content;
  const Content({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: content.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)
            ),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){
                if(content[index].title=="Science"){
                  Get.to(Science());
                }
                if(content[index].title=="Technology"){
                  Get.to(Technology(title: "Technology",));
                }
                if(content[index].title=="Economics"){
                  Get.to(Technology(title: "Economics",));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  content[index].image==null?Container():Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                        ),
                        image: DecorationImage(
                            image: NetworkImage(content[index].image),fit: BoxFit.cover
                        )
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 12),
                    child: Text(content[index].title.replaceFirst("<br>", "")=="News"?"Article":content[index].title.replaceFirst("<br>", "")??"",
                      style: style2,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,right: 12),
                    child: Html(
                      data: content[index].content,
                      style: {
                        "p": Style(color: Colors.white, fontWeight: FontWeight.w400),
                        "li": Style(color: Colors.white, fontWeight: FontWeight.w500),
                        "a": Style(color: Colors.red, fontWeight: FontWeight.w400),
                      }
                    )
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

