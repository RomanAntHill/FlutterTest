import 'package:flutter_test_app/data/models/model.dart';

class Album extends Model {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']);

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];

  @override
  Map<String, dynamic> get toJson => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
