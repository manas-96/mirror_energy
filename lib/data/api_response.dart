import 'dart:convert';

import 'package:http/http.dart'as http;

class ApiResponse{

  final String baseUrl = "https://mirrorenergy.org/api/";

  _buildHeader(){
    return { 'Content-Type' : 'application/json', 'cache-control' : 'no-cache'};
  }

  allProducts() async {
    final body={"db":"products"};
    final response = await http.post(baseUrl+"fetchAll", body: json.encode(body));
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      if(resData["response_code"]=="200")
        return resData["data"];
      return 'failed';
    } else return 'failed';
  }
  allArticles() async {
    final body={"db":"blogs"};
    final response = await http.post(baseUrl+"fetchAll", body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      if(resData["response_code"]=="200"){
        return resData["data"];
      }
      return 'failed';
    } else {
      return 'failed';
    }
  }

  filterContent(body) async {
    final response = await http.post(baseUrl+"pageWiseFetch", body: json.encode(body));
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      if(resData["response_code"]=="200")
        return resData["data"];
      return 'failed';
    } else return 'failed';
  }
}