class GenderModel{
  late int genderID1;
  late String genderName1;

  GenderModel({required this.genderID1,required this.genderName1});
  int get genderID => genderID1;

  set genderID(int genderID) {
    genderID1 = genderID;
  }

  String get genderName => genderName1;

  set genderName(String genderName) {
    genderName1 = genderName;
  }
}