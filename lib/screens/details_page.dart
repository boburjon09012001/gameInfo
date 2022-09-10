import 'package:flutter/material.dart';
import 'package:game_info/models/data_model.dart';

class DetailsPage extends StatelessWidget {
  // static const String idScreen = "detailsPage";
  final DataModel dataModel;
   DetailsPage({Key? key, required this.dataModel}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 230.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(dataModel.image),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const  SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Text(dataModel.title,
                              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                        ),
                      const  SizedBox(width: 12.0,),
                        if(dataModel.worth != "N/A")
                          const SizedBox(height: 12.0,),
                        if(dataModel.worth != "N/A")
                          Container(
                            padding:const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(dataModel.worth,
                            style:const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,

                            ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12.0,),
                    Text("Available in:${dataModel.platforms}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                  const  Text("Game Description",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(dataModel.description),
                    const SizedBox(
                      height: 36.0,
                    ),
                   const Text(
                    "Steps to get it", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                   const SizedBox(
                      height: 4.0,
                    ),
                   Text(dataModel.instructions,
                   style: const TextStyle(),
                   ),
                    const SizedBox(
                      height: 39.0,
                    ),
                    Row(
                      children: [
                        Container(
                          padding:const EdgeInsets.all(4),
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF91219B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text("Open In "
                                  "\Gamerpower",
                                style:TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),
                          ),
                        ),
                       const SizedBox(width: 10,),
                        Container(
                          padding:const EdgeInsets.all(4),
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF08A4B7),
                         borderRadius: BorderRadius.circular(12),
                          ),
                            child: const Center(
                            child: Padding(
                              padding:EdgeInsets.all(4.0),
                              child: Text("Get the game",
                                style:TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
