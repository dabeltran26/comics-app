import 'package:comics_app/detail_page/bloc/detail_bloc.dart';
import 'package:comics_app/detail_page/bloc/detail_event.dart';
import 'package:comics_app/detail_page/bloc/detail_state.dart';
import 'package:comics_app/detail_page/models/comic_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {

  final String comicUrl;
  DetailPage({Key key, @required this.comicUrl}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  DetailBloc _bloc = DetailBloc();

  @override
  void initState() {
    _bloc.add(InitEvent(widget.comicUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {

          if (state is DataState) {
            return CustomScrollView(
              slivers: <Widget>[
                createAppbar(state.comic),
                SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        SizedBox(height: 10.0),
                        _posterComic( context, state.comic ),
                        _description( state.comic ),
                      ]
                  ),
                )
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              child: Center(child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
              )),
            ),
          );
        },
      ),
    );
  }

  Widget createAppbar(ComicDetailModel comic) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black26,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          comic.name != null ? comic.name : '',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: Image(
          image: NetworkImage(comic.image.screenUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterComic(BuildContext context, ComicDetailModel comic ){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Hero(
        tag: comic.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: NetworkImage( comic.image.screenUrl),
            height: 150.0,
          ),
        ),
      ),
    );

  }

  Widget _description( ComicDetailModel comic ) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Text(
          comic.description != null ? removeAllHtmlTags(comic.description) : ' Sin descripcion',
          textAlign: TextAlign.justify,
        ),
      ),
    );

  }
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}
