import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_energy/screens/components/styles.dart';
import 'package:mirror_energy/data/models/Product.dart';
import 'package:mirror_energy/screens/paypal_payment.dart';

import '../shipping_details.dart';

class Products extends StatelessWidget {
  final List<Product> product;
  final showText;

  const Products({Key key, this.product, this.showText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: product.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                 index==0? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            image: NetworkImage(product[index].image),
                            fit: BoxFit.fill)),
                  ):Container(),

                  index==0?SizedBox(height: 20,):Container(),
                  Container(width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          product[index].description,
                          style: style1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${product[index].tag}",
                          style: style3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\$ ${product[index].price}",
                          style: style2,
                        ),


                        InkWell(
                          onTap: (){
                            Get.to(PaypalPayment(
                              title: product[index].description,
                              amount: product[index].price,
                              onFinish: (){},
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("images/paypal.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
