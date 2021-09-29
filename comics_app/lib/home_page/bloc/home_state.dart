import 'package:comics_app/models/comic_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitState extends HomeState{}

class DataState extends HomeState{
  final List<ComicListModel> comics;
  DataState(this.comics);
}