import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:mirror_energy/data/models/content_model.dart';
import 'package:mirror_energy/screens/components/styles.dart';


class BannerImage extends StatelessWidget {
  final List<ContentModel>data;

  const BannerImage({Key key, this.data, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/banner.gif",),fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: data.isEmpty?Container(height: 150,): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(data[0].title,style: style2,),
            ),
            SizedBox(height: 2,),
            Html(data: data[0].content,style: {
              "p": Style(color: Colors.white, fontWeight: FontWeight.w400),
            },),
            SizedBox(height: 30,)
            // Html(
            //     data: data[0].content,
            //     style: {
            //       "p": Style(color: Colors.white, fontWeight: FontWeight.w400)
            //     }
            // ),
          ],
        )
      ),
    );
  }
}
