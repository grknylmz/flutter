import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final String _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  // Get top news
  Future<List<int>> fetchTopIds() async {
    final response = await client
        .get('$_root/topstories.json?print=pretty');
    final List<dynamic> ids = json.decode(response.body);

    return ids.cast<int>();
  }

  // Get item data
  Future<ItemModel> fetchItem(int id) async {
    final response = await client
        .get('$_root/item/$id.json?print=pretty');
    final ItemModel item = ItemModel.fromJson(json.decode(response.body));

    return item;
  }

}