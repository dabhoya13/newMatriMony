class ReligionModel{
  late int religionID1;
  late String religionName1;

  ReligionModel({required this.religionID1 , required this.religionName1});
  int get religionID => religionID1;

  set religionID(int religionID) {
    religionID1 = religionID;
  }

  String get religionName => religionName1;

  set religionName(String religionName) {
    religionName1 = religionName;
  }
}