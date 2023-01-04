import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:sosyal_duvar/constants/text_strings.dart';

import 'package:sosyal_duvar/models/yorum_model.dart';

class YorumService {
  Dio dio = new Dio(BaseOptions(connectTimeout: 50000, receiveTimeout: 50000));

/*  Future<List<YorumModel>> getYorum() async {
    //await Future.delayed(Duration(seconds: 3));
    final response = await dio.get(url);
    try {
      if (response.statusCode == 200) {
        List<dynamic> body = response.data;
        List<YorumModel> posts =
            body.map((e) => YorumModel.fromJson(e)).toList();

        return posts;
      } else {
        throw "${response.statusCode}  Unable to retrieve posts ";
      }
    } catch (e) {
      throw "${e} ";
    }
  }*/
  // Tüm yorumları getir
  Future<List<YorumModel>> getYorum() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<YorumModel> posts =
            body.map((e) => YorumModel.fromJson(e)).toList();
        return posts;
      } else {
        throw "${response.statusCode}  Unable to retrieve posts ";
      }
    } catch (e) {
      throw "${e} ";
    }
  }

  //Tek bir paylaşımı getir
  Future<YorumModel?> getPost(String id) async {
    final response = await http.get(Uri.parse(url + '/$id'));
    Map<String, dynamic> post = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(post);
      return YorumModel.fromJson(post);
    }
  }

  //yorum silme
  Future deleteData(int id) async {
    final response = await http.delete(Uri.parse(url + '2/comment/1'));
    if (response.statusCode == 204) {
      return;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
