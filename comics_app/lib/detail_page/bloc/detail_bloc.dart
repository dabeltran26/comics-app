import 'package:bloc/bloc.dart';
import 'package:comics_app/detail_page/bloc/detail_event.dart';
import 'package:comics_app/detail_page/models/comic_detail_model.dart';
import 'package:comics_app/detail_page/resository/detail_repository.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent,DetailState>{

  DetailRepository _detailRepository = DetailRepository();
  ComicDetailModel comic;

  @override
  DetailState get initialState => InitState();

  @override
  Stream<DetailState> mapEventToState(DetailEvent event)  async*{

    if(event is InitEvent) {
      comic = await _detailRepository.getComic(event.comicUrl);
      yield DataState(comic);
    }

  }
}