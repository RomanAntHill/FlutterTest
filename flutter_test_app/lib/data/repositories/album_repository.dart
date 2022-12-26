import 'package:dio/dio.dart';
import 'package:flutter_test_app/data/models/album.dart';

abstract class AlbumRepositoryRequest {
  Future fetchAlbumList();
}

class AlbumRepository extends AlbumRepositoryRequest {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));


  @override
  Future fetchAlbumList() async {
    var route = '/photos';

    try {
      var res = await dio.get((route));
      if(res.statusCode == 200){
        List<Album> list = [];
        const dataLength = 20;
        for(var json in res.data){
          list.add(Album.fromJson(json));
          if(list.length == dataLength) {
            break;
          }
        }
        return list;
      }
      return res.data.toString();
    } catch (e) {
      rethrow;
    }
  }
}
