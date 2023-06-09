import 'package:flutter/material.dart';
import 'package:live_cricket_tv/widgets/background_widget.dart';

import '../models/history.dart';
import '../utility/data_api.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/history_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          titleText: 'History'
      ),
      body: BackgroundWidget(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<History>>(
          future: DataApi.getAllHistory(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              List<History> historyList = snapshot.data;
              return ListView.builder(
                  itemCount: historyList.length,
                  itemBuilder: (context, index){
                return HistoryWidget(history: historyList[index]);
              });
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
