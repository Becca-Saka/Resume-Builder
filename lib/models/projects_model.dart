class ProjectsModel{
  String title,  startDate, endDate,summary;
  ProjectsModel({this.title, this.endDate, this.startDate, this.summary});

  ProjectsModel.fromMap(Map<String, dynamic> map)
    : title = map['title'],
      startDate = map['startDate'],
      endDate = map['endDate'],
      summary = map['summary'];

   Map<String, dynamic> toMap() {
    return {
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
      'summary': summary,
    };

    
  }

   @override
  String toString() {
    return 'ProjectsModel{id: $title, startDate: $startDate, endDate: $endDate, summary: $summary }';
  }

}