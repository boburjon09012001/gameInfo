import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info/bloc/game_data_bloc.dart';
import 'package:game_info/models/data_model.dart';
import 'package:game_info/repo/games_repo.dart';
import 'package:game_info/screens/details_page.dart';
import 'package:game_info/screens/landing_page.dart';


void main() {
 runApp(
   BlocProvider<GameDataBloc>(
     create: (context)=> GameDataBloc(GamesRepo()),
   child: MyApp(),
   ),
 );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black
      ),
      home: const LandingPage(),
      routes: {
        LandingPage.idScreen : (context) =>const LandingPage(),
        // DetailsPage.idScreen : (context) => DetailsPage(dataModel:),
      }
    );
  }
}

