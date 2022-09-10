import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_info/models/data_model.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../bloc/game_data_bloc.dart';
import 'details_page.dart';


class LandingPage extends StatefulWidget {
  static const String idScreen = "landingPage";

  const LandingPage({Key? key}) : super(key: key);


  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  initState() {
    super.initState();
    context.read<GameDataBloc>().add(LoadGameDataEvent());
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if(state is GameDataInitialState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        else if(state is GameDataErrorState){
            return  const Center(
              child: Text("Something went wrong"),
            );
          }
        else if(state is GameDataLoadingState){
            return const Center(
              child: Text("Loading"),
            );
          }
        else if(state is GameDataLoadedState){
            return buildGameModel(state.apiResult);
          }
          return Container();
        },
      ),
    );
  }


  Widget buildGameModel(List<DataModel>apiResult){
    return SafeArea(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: apiResult.length,
          itemBuilder: (BuildContext context, int index){
             final DataModel dataModel = apiResult[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(dataModel: dataModel)));
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children:[
                      ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                        child: Image(
                          width: MediaQuery.of(context).size.width / 1.05,
                          height: 230, image: NetworkImage(dataModel.image),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                          child: GlassmorphicContainer(
                            width: MediaQuery.of(context).size.width / 1.05,
                            height: 100,
                            border: 0,
                            borderRadius: 0,
                            blur: 20,
                            alignment: Alignment.bottomCenter,
                            linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                              const  Color(0xFFFFFFFF).withOpacity(0.1),
                              const  Color(0xFFFFFFFF).withOpacity(0.5),
                              ],
                              stops:const [
                                0.1,
                                1,
                              ],
                            ),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const  Color(0xFFFFFFFF).withOpacity(0.5),
                                const  Color(0xFFFFFFFF).withOpacity(0.5),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      dataModel.title,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    "Platforms:${dataModel.platforms}",
                                    style: const TextStyle(fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }





}
