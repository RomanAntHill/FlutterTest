import 'package:equatable/equatable.dart';

import '../../models/album.dart';

abstract class AlbumState extends Equatable{
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumError extends AlbumState {
  final String message;

  const AlbumError(this.message);

  @override
  List<Object> get props => [message];
}

class AlbumListLoaded extends AlbumState {
  final List<Album> list;

  const AlbumListLoaded(this.list);

  @override
  List<Object> get props => [list];
}