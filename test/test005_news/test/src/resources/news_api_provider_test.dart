import 'package:test005_news/src/resources/news_api_provider.dart';
import 'package:test005_news/src/models/item_model.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final NewsApiProvider newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4, 5]), 200);
    });

    final List<int> ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4, 5]);
  });

  test('FetchItem return a model', () async {
    final NewsApiProvider newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final Object jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final ItemModel item = await newsApi.fetchItem(123);

    expect(item.id, 123);
  });
}