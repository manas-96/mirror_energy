import 'package:flutter/material.dart';
import 'package:mirror_energy/screens/components/app_bar.dart';
import 'package:mirror_energy/screens/components/body.dart';
import 'package:mirror_energy/screens/components/buttons.dart';

import 'components/styles.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String firstName="";
  String lastName = "";
  String email = "";
  String phone = "";
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, Text("Contact Us")),
      body: body(
        context: context,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text("Get in Touch",style: style2,),
                        SizedBox(height: 10,),
                        Text("You can contact us any way that is convenient for you."
                            " We are available 24/7 via fax or email. You can also use a quick contact"
                            " form below or visit us personally.\n\n"
                            "We would be happy to answer your questions.",
                          style: style3,
                        ),
                        SizedBox(height: 25,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (val){
                            firstName=val;
                          },
                          decoration: InputDecoration(
                              hintText: "First name",
                              hintStyle: style3,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (val){
                            lastName=val;
                          },
                          decoration: InputDecoration(
                              hintText: "Last name",
                              hintStyle: style3,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val){
                            email=val;
                          },
                          decoration: InputDecoration(
                              hintText: "Email address",
                              hintStyle: style3,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          onChanged: (val){
                            phone=val;
                          },
                          decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: style3,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (val){
                            message=val;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                              hintText: "Message...",
                              hintStyle: style3,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 25,),
                        button2(
                            onPress: (){},
                            title: "Send a message"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              content(Icons.location_pin, "528 Pennsylvania Avenue, Glen Ellyn, Illinois (IL) 60137 USA"),

              content(Icons.email_outlined, "norm@mirrorenergy.com"),
              content(Icons.phone, "(630) 587-5665"),
            ],
          )
        )
      ),
    );
  }
  content(icon,text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Container(width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Icon(icon,color: Colors.white,size: 40,),
              SizedBox(height: 10,),
              Text(text,
                style: style3,textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
