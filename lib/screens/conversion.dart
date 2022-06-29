import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:mirror_energy/data/api_response.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/styles.dart';


class Conversion extends StatefulWidget {
  const Conversion({Key key}) : super(key: key);

  @override
  _ConversionState createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  List content=[];
  getData()async{
    final result = await ApiResponse().filterContent({"filter": "Conversion"});
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
      appBar: appBar(context, Text("Conversion")),
      body: body(
        context: context,
        child: content.length==0?Center(
          child: CircularProgressIndicator(),
        )
            :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: content.length,
              itemBuilder: (context,index){
                if(index==2){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        child: RichText(
                          text: new TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: "Starships "
                                  ,style: TextStyle(color: Colors.red,fontSize: 22, fontWeight: FontWeight.bold )
                              ),
                              new TextSpan(text: content[index]["title"].toString().split("Starships").last, style: style2),
                            ],
                          ),
                        )
                      ),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index==0?Container():Text(content[index]["title"],style: style2,),
                    SizedBox(height: 20,),
                    Html(
                      data: content[index]["content"],
                      style: {
                        "p": Style(color: Colors.white, fontWeight: FontWeight.w400),
                        "a": Style(color: Colors.red, fontWeight: FontWeight.w400)
                      },
                    ),
                    SizedBox(height: 20,),


                  ],
                );
              },
            )
          ),
        )
      ),
    );
  }
}
