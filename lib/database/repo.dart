import '../models/education_model.dart';
import '../models/experience_model.dart';
import '../models/projects_model.dart';
import '../models/reference_model.dart';
import '../models/skils_model.dart';

class AppRepo{
  static String imagePath;
  static String fullName;
  static String phoneNumber;
  static String email;
  static String address;
  static String profession;
  static String about;
  static String website;
  static String achievements;
  static List<EducationModel> educationModel=[];
  static List<SkillsModel> skillsModel=[];
  static  List<ExperienceModel> experienceModel=[];
  static List<ReferenceModel> referenceModel=[];
  static List<ProjectsModel> projectsModel=[];
}