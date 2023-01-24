class CityModel{
  late int CityID1;
  late String CityName1;

  CityModel({required this.CityID1,required this.CityName1,});

  int get CityID => CityID1;

  set CityID(int CityID) {
    CityID1 = CityID;
  }


  String get CityName => CityName1;

  set CityName(String CityName) {
    CityName1 = CityName;
  }
}