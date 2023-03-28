import 'package:bloc_example/app/modules/home/bloc/home_bloc.dart';
import 'package:bloc_example/app/modules/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: BlocProvider.of<HomeBloc>(context),
            builder: (context, state) {
              if (state is HomeStateLoaded) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.list[index]),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
