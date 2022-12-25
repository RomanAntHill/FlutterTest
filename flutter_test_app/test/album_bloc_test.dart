import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/data/blocs/album/album_blocc.dart';
import 'package:flutter_test_app/data/blocs/album/album_event.dart';
import 'package:flutter_test_app/data/blocs/album/album_state.dart';
import 'package:flutter_test_app/data/fake_data/album_fake.dart';
import 'package:flutter_test_app/data/repositories/album_repository.dart';

void main() {
  late AlbumRepository userRepository;
  late AlbumBloc userBloc;

  setUp(() {
    userRepository = AlbumRepository();
    userBloc = AlbumBloc(userRepository);
  });

  blocTest<AlbumBloc, AlbumState>(
    'Get album list',
    build: () => userBloc,
    act: (userBloc) => userBloc.add(AlbumGetList()),
    expect: () => [AlbumLoading(), AlbumListLoaded(fakeAlbumList)],
  );
}