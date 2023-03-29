import 'package:bloc_example/app/modules/home/bloc/home_bloc.dart';
import 'package:bloc_example/app/modules/home/bloc/home_event.dart';
import 'package:bloc_example/app/modules/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          return body(state, bloc);
        });
  }

  Widget body(HomeState state, HomeBloc bloc) {
    if (state is HomeStateLoaded) {
      return HomePageLoaded(state: state, bloc: bloc);
    } else if (state is HomeErrorState) {
      return Center(
        child: Text(state.message),
      );
    }
    return Scaffold(appBar: AppBar(title: const Text('Bloc Example')), body: const Center(child: CircularProgressIndicator()));
  }
}

class HomePageLoaded extends StatelessWidget {
  final HomeStateLoaded state;
  final HomeBloc bloc;
  const HomePageLoaded({super.key, required this.state, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HomeEventAddItem event = HomeEventAddItem(descricaoItem: 'Descrição teste', state: state);
          bloc.add(event);
        },
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.list[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
