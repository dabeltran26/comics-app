import 'package:comics_app/detail_page/screens/detail_page.dart';
import 'package:comics_app/home_page/bloc/home_bloc.dart';
import 'package:comics_app/home_page/bloc/home_event.dart';
import 'package:comics_app/home_page/bloc/home_state.dart';
import 'package:comics_app/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {

          if (state is DataState) {
            return Padding(
              padding: EdgeInsets.only(top: screenSize.height *0.02),
              child: GridView.builder(
                  itemCount: state.comics.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) => cardComic(state.comics,index))
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

  Widget cardComic(List<ComicListModel> comics, int index){
    return Container(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(comicUrl: comics[index].apiDetailUrl,)),
          );
        },
        child: FadeInImage(
          image: NetworkImage(comics[index].image.originalUrl),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
