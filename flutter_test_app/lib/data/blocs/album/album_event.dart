import 'package:equatable/equatable.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class AlbumGetList extends AlbumEvent {
  const AlbumGetList();
  @override
  List<Object> get props => [];
}
