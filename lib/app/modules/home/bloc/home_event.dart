// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_example/app/modules/home/bloc/home_state.dart';

class HomeEvent {
}

class HomeFetchList extends HomeEvent {}

class HomeFetchListWithError extends HomeEvent {}

class HomeFetchListWithEmptyList extends HomeEvent {}

class HomeEventAddItem extends HomeEvent {
  final String descricaoItem;
  final HomeStateLoaded state;
  HomeEventAddItem({required this.descricaoItem, required this.state});
}
