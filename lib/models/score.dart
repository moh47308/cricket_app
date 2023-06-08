class Score {
  late int id;
  late String name;
  late String startDate;
  late String endDate;
  late String odi;
  late String t20;
  late String test;
  late String squads;
  late String matches;

  Score({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.odi,
    required this.t20,
    required this.test,
    required this.squads,
    required this.matches,
  });


 factory Score.fromJson( Map<String, dynamic> json){
   return Score(
     id: json['id'],
     name: json['name'],
     startDate: json['startDate'],
     endDate: json['endDate'],
     odi: json['odi'],
     t20: json['t20'],
     test: json['test'],
     squads: json['squads'],
     matches: json['matches'],
   );
 }
}