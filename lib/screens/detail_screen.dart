import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/score.dart';
import '../utility/data_api.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/score_widget.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget  {

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{
  List<Score> details = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Live Details'),
      body: BackgroundWidget(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        Column(
                          children: [
                            Text("id ${details[index].id}"),
                            Text("name ${details[index].name}"),
                            Text("startDate ${details[index].startDate}"),
                            Text("endDate ${details[index].endDate}"),
                            Text("odi ${details[index].odi}"),
                            Text("t20 ${details[index].t20}"),
                            Text("test ${details[index].test}"),
                            Text("squads ${details[index].squads}"),
                            Text("matches ${details[index].matches}"),
                          ],
                        ),
                      ],
                    );
                  });
            }else{
              return Row(
                children: [
                  Column(
                    children: const [
                      Text("There are no data to display"),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Score>> getData() async{
    final response = await http.get(Uri.parse('https://api.cricapi.com/v1/series?apikey=36cdfa25-2527-41c8-b740-504bb90ee55f'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for(Map<String, dynamic> index in data) {
        details.add(Score.fromJson(index));
      }
      return details;
    }else{
      return details;
    }
  }

}