
class ImageModel {
  int id;
  String albumId;
  String title;
  String url;
  String thumbnailUrl;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJSON(Map<String, dynamic> parsedJSON) {
    id    = parsedJSON['id'];
    url   = parsedJSON['url'];
    title = parsedJSON['title'];
  }

  /*
  ImageModel.fromJSON(Map<String, dynamic> parsedJSON)
    : id    = parsedJSON['id'],
      url   = parsedJSON['url'],
      title = parsedJSON['title'];
  */
}