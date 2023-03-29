import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class HomeStateLoaded extends HomeState {
  final List<String> list;
  HomeStateLoaded({required this.list});
  @override
  List<Object?> get props => [list];
}

class HomeStateEmptyList extends HomeState {
  @override
  List<Object?> get props => [];
}
