import 'dart:io';

import 'package:flutter/services.dart';
import 'package:newmatrimony/favourite_user.dart';
import 'package:newmatrimony/models/city_model.dart';
import 'package:newmatrimony/models/gender_model.dart';
import 'package:newmatrimony/models/religion_model.dart';
import 'package:newmatrimony/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'mymatrimony.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mymatrimony.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'mymatrimony.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<int> deleteUserFromUserTable(userID)
  async {
    Database db = await initDatabase();
    int deletedid = await db.delete('Tbl_User',where: 'UserID = ?',whereArgs: [userID]);
    return deletedid;
  }
  Future<void> updateFavouriteUser(int userID, favUser)
  async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();
    map['FavouriteUser'] = favUser;
    if(userID != -1)
    {
      await db.update('Tbl_User', map,where: 'UserID = ?',whereArgs: [userID]);
    }else{
      await db.insert('Tbl_User', map);
    }

  }
  Future<void> upsertIntoUserTable({cityId,userName,dob,userId,gender,mobileNo,religion,height})
  async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();
    map['UserName']=userName;
    map['DOB']=dob;
    map['CityID']=cityId;
    map['Gender']=gender;
    map['MobileNo']=mobileNo;
    map['Religion']=religion;
    map['Height']=height;
    if(userId != -1)
    {
      await db.update('Tbl_User', map,where: 'UserID = ?',whereArgs: [userId]);
    }else{
      await db.insert('Tbl_User', map);
    }

  }
  Future<List<CityModel>> getCityListFromTbl() async {
    List<CityModel> cityList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from City_Tbl');
    CityModel model = CityModel(CityName1: 'Select City',CityID1: -1);
    model.CityID = -1;
    model.CityName='Select City';
    cityList.add(model);
    for (int i = 0; i < data.length; i++) {
      model = CityModel(
          CityID1: data[i]['CityID'] as int,
          CityName1: data[i]['CityName'].toString());
      cityList.add(model);
    }
    return cityList;
  }
  Future<List<GenderModel>> getGenderFromTbl() async {
    List<GenderModel> genderList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Gender_Tbl');
    GenderModel model = GenderModel(genderName1: 'Select Gender',genderID1: -1);
    model.genderID = -1;
    model.genderName='Select Gender';
    genderList.add(model);
    for (int i = 0; i < data.length; i++) {
      model = GenderModel(
          genderID1: data[i]['GenderID'] as int,
          genderName1: data[i]['GenderName'].toString());
      genderList.add(model);
    }
    return genderList;
  }
  Future<List<ReligionModel>> getReligionFromTbl() async {
    List<ReligionModel> religionList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Tbl_Religion');
    ReligionModel model = ReligionModel(religionName1: 'Select Religion',religionID1: -1);
    model.religionID = -1;
    model.religionName='Select Religion';
    religionList.add(model);
    for (int i = 0; i < data.length; i++) {
      model = ReligionModel(
          religionID1: data[i]['ReligionID'] as int,
          religionName1: data[i]['ReligionName'].toString());
      religionList.add(model);
    }
    return religionList;
  }

  Future<List<UserModel>> getUserListFromTbl() async {
    List<UserModel> userList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Tbl_User');
    for(int i=0; i<data.length; i++)
    {
      UserModel model = UserModel();
      model.CityID = data[i]['CityID'] as int;
      model.UserName = data[i]['UserName'].toString();
      model.UserID = data[i]['UserID'] as int;
      model.DOB = data[i]['DOB'].toString();
      model.Gender =  data[i]['Gender'] as int;
      model.Religion = data[i]['Religion'] as int;
      model.MobileNo = data[i]['MobileNo'] as int;
      model.Height = data[i]['Height'].toString();
      model.FavouriteUser = data[i]['FavouriteUser'] as int;
      userList.add(model);

    }
    return userList;
  }
  Future<List<UserModel>> getMaleUserFromTbl() async {
    List<UserModel> maleUserList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Tbl_User where Gender = 1');
    for(int i=0; i<data.length; i++)
    {
      UserModel model = UserModel();
      model.CityID = data[i]['CityID'] as int;
      model.UserName = data[i]['UserName'].toString();
      model.UserID = data[i]['UserID'] as int;
      model.DOB = data[i]['DOB'].toString();
      model.Gender =  data[i]['Gender'] as int;
      model.Religion = data[i]['Religion'] as int;
      model.MobileNo = data[i]['MobileNo'] as int;
      model.Height = data[i]['Height'].toString();
      maleUserList.add(model);

    }
    return maleUserList;
  }
  Future<List<UserModel>> getFemaleUserFromTbl() async {
    List<UserModel> femaleUserList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Tbl_User where Gender = 2');
    for(int i=0; i<data.length; i++)
    {
      UserModel model = UserModel();
      model.CityID = data[i]['CityID'] as int;
      model.UserName = data[i]['UserName'].toString();
      model.UserID = data[i]['UserID'] as int;
      model.DOB = data[i]['DOB'].toString();
      model.Gender =  data[i]['Gender'] as int;
      model.Religion = data[i]['Religion'] as int;
      model.MobileNo = data[i]['MobileNo'] as int;
      model.Height = data[i]['Height'].toString();
      femaleUserList.add(model);

    }
    return femaleUserList;
  }
  Future<List<UserModel>> getFavouriteUserFromTbl() async {
    List<UserModel> favUserList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from Tbl_User where FavouriteUser = 2');
    for(int i=0; i<data.length; i++)
    {
      UserModel model = UserModel();
      model.CityID = data[i]['CityID'] as int;
      model.UserName = data[i]['UserName'].toString();
      model.UserID = data[i]['UserID'] as int;
      model.DOB = data[i]['DOB'].toString();
      model.Gender =  data[i]['Gender'] as int;
      model.Religion = data[i]['Religion'] as int;
      model.MobileNo = data[i]['MobileNo'] as int;
      model.Height = data[i]['Height'].toString();
      favUserList.add(model);

    }
    return favUserList;
  }
}
