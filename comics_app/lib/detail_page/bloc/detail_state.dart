import 'package:comics_app/detail_page/models/comic_detail_model.dart';
import 'package:comics_app/models/comic_model.dart';
import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable{
  const DetailState();

  @override
  List<Object> get props => [];
}

class InitState extends DetailState{}

class DataState extends DetailState{
  final ComicDetailModel comic;
  DataState(this.comic);
}