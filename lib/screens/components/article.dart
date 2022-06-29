import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/data/models/article_model.dart';
import 'package:mirror_energy/screens/blog_details.dart';
import 'package:mirror_energy/screens/components/styles.dart';


class Article extends StatelessWidget {
  final List<ArticleModel> articleModel;
  const Article({Key key, this.articleModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: articleModel.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)
            ),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){
                Get.to(BlogDetails(
                  title: articleModel[index].title,
                  content: articleModel[index].content,
                  image: articleModel[index].image,
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)
                        ),
                        image: DecorationImage(
                            image: NetworkImage(articleModel[index].image),fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Text("Article",
                      style: style1,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 12),
                    child: Text(articleModel[index].title??"",
                      style: style2,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 12),
                    child: Text(articleModel[index].short_description??"",
                      style: style3,
                    ),
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
