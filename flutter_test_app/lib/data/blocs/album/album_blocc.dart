import 'package:bloc/bloc.dart';
import 'package:flutter_test_app/data/models/album.dart';

import '../../repositories/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumRepository albumRepository;
  AlbumBloc(this.albumRepository) : super(AlbumInitial());
  Stream<AlbumState> mapEventToState(
    AlbumEvent event,
  ) async* {
    yield AlbumLoading();

    if (event is AlbumGetList) {
      try {
        var res = await albumRepository.fetchAlbumList();
        if (res is List<Album>) {
          yield AlbumListLoaded((res));
        }
      } catch (e) {
        yield AlbumError(e.toString());
      }
    }
  }
}
