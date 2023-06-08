import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:live_cricket_tv/models/history.dart';
import '../models/match.dart';
import '../models/team.dart';
import '../models/venue.dart';
import '../models/history.dart';
import '../models/score.dart';
import 'package:http/http.dart' as http;


class DataApi{
  static Future<List<Match>> getAllMatches(BuildContext context) async{
    var matches = <Match>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var jsonSchedule = jsonData['schedule'];
    for(var jsonMatch in jsonSchedule){
      Match match = Match.fromJSON(jsonMatch);
      matches.add(match);
    }
    return matches;
  }

  static Future<List<Venue>> getAllVenues(BuildContext context) async{
    var venues = <Venue>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode( data );
    var jsonVenues = jsonData['venues'];
    for( var jsonVenue in jsonVenues){
      Venue venue = Venue.fromJSON(jsonVenue);
      venues.add(venue);
    }
    return venues;
  }

  static Future<List<History>> getAllHistory(BuildContext context) async{
    var historyList = <History>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode( data );
    var jsonHistory = jsonData['history'];
    for(var mapHistory in jsonHistory){
      History history = History.fromJSON(mapHistory);
      historyList.add(history);
    }
    return historyList;
  }

  static Future<List<Team>> geyAllTeam(BuildContext context) async{
    var teams = <Team>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode( data );
    var jsonTeams = jsonData['teams'];
    for(var jsonTeam in jsonTeams){
      Team team = Team.fromJSON(jsonTeam);
      teams.add(team);
    }
    return teams;
  }

  static Future<List<Score>> getAllDetails(BuildContext context) async{
    var details = <Score>[];
    const url = 'https://api.cricapi.com/v1/series?apikey=36cdfa25-2527-41c8-b740-504bb90ee55f';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);
      var jsondetails = jsonResponse['data'];

      for(var detail in jsondetails)
      {
        Score score = Score.fromJson(detail);
        details.add(score);
      }
      return details;
    }
    else{
      return details;
    }
  }
}