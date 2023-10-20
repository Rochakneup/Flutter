import 'package:http/http.dart' as http;
import 'package:demo1/static.dart';
import 'dart:convert' as convert;

import '../Model/newsapi.dart';
class GetApi{
  static Future<Newsapi?>? getnewsdata() async {
    try{
      //http request
      //api call
      //https://newsapi.org/v2/everything?q=tesla&from=2023-09-16&sortBy=publishedAt&apiKey=a25a0c0b883c4f389ff5c23da0f9dfea
      String apikey = "a25a0c0b883c4f389ff5c23da0f9dfea";
      var url = Uri.https(StaticValue.baseurl, "/v2/everything",
          {"domains":"wsj.com","apiKey":apikey});
      //Await the http get response, then decode the json-formatted response
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      Newsapi data = Newsapi.fromJson(jsonResponse);
      return data;
    }
    catch(e){
      return null;
    }
  }
}