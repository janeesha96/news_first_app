

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/newsData.dart';
import '../utilities/constant.dart';

class NewsApiService {

  static Future<NewsData?>getNewsHeadLines({List<int>? storeIds, DateTime? dateFrom, DateTime? dateTo}) async {


    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey");


    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body); 
        return NewsData.fromJson(data);
      }
     return null;
    } catch (err) {
      return  null;
    }
  }

}