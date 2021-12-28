class ExperienceModel{
  String company, role, startDate, endDate,summary;
  ExperienceModel({this.company, this.role, this.endDate, this.startDate, this.summary});

    
    ExperienceModel.fromMap(Map<String, dynamic> map)
    : company = map['company'],
      role = map['role'],
      startDate = map['startDate'],
      endDate = map['endDate'],
      summary = map['summary'];

   Map<String, dynamic> toMap() {
    return {
      'company': company,
      'role': role,
      'startDate': startDate,
      'endDate': endDate,
      'summary': summary,
    };
  }


   @override
  String toString() {
    return 'ExperienceModel{company: $company, role : $role , startDate: $startDate, endDate: $endDate, summary: $summary }';
  }
}