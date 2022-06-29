import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';

import 'components/body.dart';
import 'components/styles.dart';


class BlogDetails extends StatefulWidget {
  final title;
  final content;
  final image;
  const BlogDetails({Key key, this.title, this.content, this.image}) : super(key: key);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,Image.asset("images/logo.png",height: 40,width: 80,)),
      body: body(
        context: context,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.image==null?Container():Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.image),fit: BoxFit.cover
                        )
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,right: 12),
                    child: Text(widget.title.replaceFirst("<br>", "")??"",
                      style: style2,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 12),
                      child: Text(
                           widget.content,
                          style: style3
                      )
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
