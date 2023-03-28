import 'package:bloc_example/app/modules/home/bloc/home_bloc.dart';
import 'package:bloc_example/app/modules/home/bloc/home_event.dart';
import 'package:bloc_example/app/modules/home/bloc/home_state.dart';
import 'package:bloc_example/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeLoadingState())..add(HomeFetchList()),
        child: const HomePage()),
    );
  }
}
