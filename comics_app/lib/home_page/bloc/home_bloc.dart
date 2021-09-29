import 'package:bloc/bloc.dart';
import 'package:comics_app/home_page/repository/home_repository.dart';
import 'package:comics_app/models/comic_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{

  HomeRepository _homeRepository = HomeRepository();
  List<ComicListModel> comics;
  @override
  HomeState get initialState => InitState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event)  async*{

    if(event is InitEvent) {
      comics = await _homeRepository.getComics();
      yield DataState(comics);
    }

  }
}