import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_left,
                    size: 20.0,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color),
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined, size: 30.0),
            label: Text('Vaibhav'),
          ),
          SizedBox(width: 8.0),
          IconButton(
            padding: EdgeInsets.only(),
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFAF1018), Theme.of(context).backgroundColor],
              stops: [0, 0.3]),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}