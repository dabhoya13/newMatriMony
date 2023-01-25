class UserModel{
  late int _UserID;
  late String _UserName;
  late String _DOB;
  late int _Gender;
  late int _MobileNo;
  late int _Religion;
  late String _Height;
  late int _CityID;
  late bool _FavouriteUser;

  bool get FavouriteUser => _FavouriteUser;

  set FavouriteUser(bool FavouriteUser) {
    _FavouriteUser = FavouriteUser;
  }

  int get UserID => _UserID;

  set UserID(int UserID) {
    _UserID = UserID;
  }

  String get UserName => _UserName;

  set UserName(String UserName) {
    _UserName = UserName;
  }


  String get DOB => _DOB;

  set DOB(String DOB) {
    _DOB = DOB;
  }


  int get Gender => _Gender;

  set Gender(int Gender) {
    _Gender = Gender;
  }


  int get MobileNo => _MobileNo;

  set MobileNo(int MobileNo) {
    _MobileNo = MobileNo;
  }


  int get Religion => _Religion;

  set Religion(int Religion) {
    _Religion = Religion;
  }


  String get Height => _Height;

  set Height(String Height) {
    _Height = Height;
  }


  int get CityID => _CityID;

  set CityID(int CityID) {
    _CityID = CityID;
  }
}
