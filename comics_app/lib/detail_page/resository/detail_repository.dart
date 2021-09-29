import 'dart:convert';
import 'package:comics_app/detail_page/models/comic_detail_model.dart';
import 'package:http/http.dart' as http;

class DetailRepository{

  String _apikey   = 'e307d16c39a2883a09443d95dc667778963c5c21';
  String _url      = 'comicvine.gamespot.com';

  Future<ComicDetailModel> getComic(String comicUrl) async {
    final newComicUrl = comicUrl.replaceAll("https://comicvine.gamespot.com/", "");
    final url = Uri.https(_url, newComicUrl, {
      'api_key'  : _apikey,
      'format' : 'json'
    });
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final comic = new ComicDetailModel.fromJson(decodedData['results']);
    return comic;
  }

}