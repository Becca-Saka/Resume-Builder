class EducationModel{
  String college, degree, startDate, endDate,summary;
  EducationModel({this.college, this.degree, this.endDate, this.startDate, this.summary});
   
    EducationModel.fromMap(Map<String, dynamic> map)
    : college = map['college'],
      degree = map['degree'],
      startDate = map['startDate'],
      endDate = map['endDate'],
      summary = map['summary'];

   Map<String, dynamic> toMap() {
    return {
      'college': college,
      'degree': degree,
      'startDate': startDate,
      'endDate': endDate,
      'summary': summary,
    };
  }

   @override
  String toString() {
    return 'EducationModel{college: $college,degree: $degree, startDate: $startDate, endDate: $endDate, summary: $summary }';
  }
}