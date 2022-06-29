import 'package:get/get.dart';
import 'package:mirror_energy/data/api_response.dart';
import 'package:mirror_energy/data/models/Product.dart';
import 'package:mirror_energy/data/models/article_model.dart';
import 'package:mirror_energy/data/models/content_model.dart';

class ProductController extends GetxController{

  getProduct()async{
    List<Product>products=[];
    final data = await ApiResponse().allProducts();
    if(data!="failed"){
      for(int i=0;i<data.length;i++){
        products.add(Product.fromJson(data[i]));
      }
    }
    return products;
  }

  getArticles()async{
    List<ArticleModel>articles=[];
    final data = await ApiResponse().allArticles();
    if(data!="failed"){
      for(int i=0;i<data.length;i++){
        articles.add(ArticleModel.fromJson(data[i]));
      }
    }
    return articles;
  }
  filterContent(body)async{
    List<ContentModel>content=[];
    final data = await ApiResponse().filterContent(body);
    if(data!="failed"){
      for(int i=0;i<data.length;i++){
        content.add(ContentModel.fromJson(data[i]));
      }
    }
    return content;
  }
}