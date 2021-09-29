import 'dart:convert';
import 'package:comics_app/models/comic_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository{

  String _apikey   = 'e307d16c39a2883a09443d95dc667778963c5c21';
  String _url      = 'comicvine.gamespot.com';

  Future<List<ComicListModel>> getComics() async {

    final url = Uri.https(_url, '/api/issues/', {
      'api_key'  : _apikey,
      'format' : 'json'
    });

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final comics = new ComicListModel.fromJsonList(decodedData['results']);
    return comics.items;
  }

}