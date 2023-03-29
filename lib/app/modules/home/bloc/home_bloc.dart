import 'package:bloc_example/app/modules/home/bloc/home_event.dart';
import 'package:bloc_example/app/modules/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) => mapEventToState(event, emit));
  }

  Future<void> mapEventToState(HomeEvent homeEvent, Emitter<HomeState> emit) async {
    if (homeEvent is HomeFetchList) {
      emit(await _fetchList());
    }
    if (homeEvent is HomeFetchListWithError) {
      emit(await _fetchListWithError());
    }
    if (homeEvent is HomeEventAddItem) {
      emit(_addItem(homeEvent));
    }
  }

  HomeState _addItem(HomeEventAddItem homeEventAddItem) {
    List<String> list = List.from(homeEventAddItem.state.list);
    list.add(homeEventAddItem.descricaoItem);
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchList() async {
    try {
      List<String> list = await Future.delayed(
          const Duration(seconds: 3),
          () => <String>[
                'Item 1',
                'Item 1',
                'Item 1',
                'Item 1',
              ]);
      return HomeStateLoaded(list: list);
    } catch (e) {
      return HomeErrorState(message: 'Erro ao carregar a lista');
    }
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () => HomeErrorState(message: 'Não foi possível carregar os dados'),
    );
  }
}
