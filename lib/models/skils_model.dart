class SkillsModel{
  String title;
  String level;
  SkillsModel({this.title, this.level});
  
   SkillsModel.fromMap(Map<String, dynamic> map)
    : title = map['title'],
      level = map['level'];

   Map<String, dynamic> toMap() {
    return {
      'title': title,
      'level': level,
    };
  }

   @override
  String toString() {
    return 'SkillsModel{title: $title,level: $level}';
  }
}