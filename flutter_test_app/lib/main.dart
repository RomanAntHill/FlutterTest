import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/data/models/album.dart';

import 'data/blocs/album/album_blocc.dart';
import 'data/blocs/album/album_event.dart';
import 'data/blocs/album/album_state.dart';
import 'data/repositories/album_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AlbumRepository albumRepository = AlbumRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AlbumBloc>(
              create: (context) => AlbumBloc(albumRepository)),
        ],
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumBloc>(context).add(AlbumGetList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: Text('..LOADING!!!'));
          }
          if (state is AlbumListLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: state.list
                    .map((album) => Card(
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${album.thumbnailUrl}'),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AlbumView(albumData: album)),
                              );
                            },
                            title: Text('${album.title}'))))
                    .toList(),
              ),
            );
          }
          if (state is AlbumError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Some error'));
        },
      ),
    );
  }
}

class AlbumView extends StatelessWidget {
  const AlbumView({super.key, required this.albumData});

  final Album albumData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${albumData.title}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('${albumData.url}', width: 300, height: 300),
            const SizedBox(height: 10),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text('${albumData.title}',
                    style: const TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
