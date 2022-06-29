import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/data/models/content_model.dart';
import 'package:mirror_energy/screens/blog_details.dart';
import 'package:mirror_energy/screens/components/buttons.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:mirror_energy/screens/technology.dart';


class Blog extends StatelessWidget {
  final List<ContentModel>data;
  const Blog({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty) return Container();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mirror Energy",style: style1),
                  SizedBox(height: 10,),
                  Text(data[index].title,style: style2),

                  Html(
                      data: data[index].content,
                      style: {
                        "p": Style(color: Colors.white, fontWeight: FontWeight.w400)
                      }
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
