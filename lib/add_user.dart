import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:newmatrimony/Database/database.dart';
import 'package:newmatrimony/models/city_model.dart';
import 'package:newmatrimony/models/gender_model.dart';
import 'package:newmatrimony/models/religion_model.dart';
import 'package:newmatrimony/models/user_model.dart';

class AddUser extends StatefulWidget {
  late UserModel? model = UserModel();

  AddUser({required this.model});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late CityModel model = CityModel(CityName1: 'Select City', CityID1: -1);
  late GenderModel model1 = GenderModel(genderID1: -1, genderName1: 'Select Gender');
  late ReligionModel model2 = ReligionModel(religionID1: -1, religionName1: 'Select Religion');
  bool isGetCity = true;
  bool isGetGender = true;
  bool isGetReligion = true;
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  MyDatabase myDatabase = MyDatabase();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.model != null ? widget.model!.UserName.toString() : '');
    mobileController = TextEditingController(
        text: widget.model != null ? widget.model!.MobileNo.toString() : '');
    heightController = TextEditingController(
        text: widget.model != null ? widget.model!.Height.toString() : '');
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: GradientColors.freshMilk, begin: Alignment.topLeft),
              ),
            ),
            elevation: 10,
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 100),
                    padding: EdgeInsets.only(left: 10),
                    height: 70,
                    width: 70,
                    child: Tab(
                        icon: new Image.asset(
                      "assets/images/marriage.png",
                    ))),
              ],
            )),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: GradientColors.ladyLips,
                      begin: Alignment.bottomRight)),
              child: Container(),
            ),
            SingleChildScrollView(
              child:
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: FutureBuilder<List<CityModel>>(
                            builder: (context, snapshot) {
                              if (snapshot != null && snapshot.hasData) {
                                if (isGetCity) {
                                  model = snapshot.data![0];
                                }
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: DropdownButtonHideUnderline(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: GradientColors.pink),
                                            borderRadius: BorderRadius.circular(25),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                                  //shadow for button
                                                  blurRadius: 5) //blur radius of shadow
                                            ]),
                                        child: DropdownButton2(
                                          items: snapshot.data!
                                              .map((item) => DropdownMenuItem<CityModel?>(
                                            value: item,
                                            child: Text(
                                              item.CityName.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                              .toList(),
                                          value: model,
                                          onChanged: (value) {
                                            isGetCity = false;
                                            setState(() {
                                              model = value!;
                                            });
                                          },
                                          icon: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: const Icon(
                                              Icons.keyboard_arrow_down_rounded,color: Colors.white,
                                            ),
                                          ),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14),
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color: Colors.pink
                                          ),
                                        ),
                                      )),
                                );
                              } else {
                                return Container();
                              }
                            },
                            future: isGetCity ? myDatabase.getCityListFromTbl() : null,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 10),
                          child: Row(
                            children: [
                              Container(
                                  child: Icon(Icons.person,size: 30,)),
                              SizedBox(width: 15,),
                              Container(
                                width: 330,
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value!.trim().length == 0) {
                                      return 'Name is Empty ';
                                    } else {
                                      return null;
                                    }
                                  },
                                    decoration: InputDecoration(
                                      labelText: "Enter Your Name",
                                      labelStyle: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),
                                      border: myinputborder(), //normal border
                                      enabledBorder: myinputborder(), //enabled border
                                      focusedBorder: myfocusborder(), //focused border
                                      // set more border style like disabledBorder
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 10),
                          child: Row(
                            children: [
                              Container(
                                  child: Icon(Icons.phone,size: 30,)),
                              SizedBox(width: 15,),
                              Container(
                                width: 330,
                                child: TextFormField(
                                    controller: mobileController,
                                    validator: (value) {
                                      if (value == null || value!.trim().length == 0 || value!.trim().length >10) {
                                        return 'Enter Correct Mobile Number ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(

                                      labelText: "Enter Mobile Number",
                                      labelStyle: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),
                                      border: myinputborder(), //normal border
                                      enabledBorder: myinputborder(), //enabled border
                                      focusedBorder: myfocusborder(), //focused border
                                      // set more border style like disabledBorder
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 10),
                          child: Row(
                            children: [
                              Container(
                                  child: Icon(Icons.height,size: 30,)),
                              SizedBox(width: 15,),
                              Container(
                                width: 330,
                                child: TextFormField(
                                    controller: heightController,
                                    validator: (value) {
                                      if (value == null || value!.trim().length == 0) {
                                        return 'Enter Height ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: "Enter Height",
                                      hintText: "In Feet",
                                      labelStyle: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),
                                      border: myinputborder(), //normal border
                                      enabledBorder: myinputborder(), //enabled border
                                      focusedBorder: myfocusborder(), //focused border
                                      // set more border style like disabledBorder
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 190,
                              child: FutureBuilder<List<GenderModel>>(
                                builder: (context, snapshot) {
                                  if (snapshot != null && snapshot.hasData) {
                                    if (isGetGender) {
                                      model1 = snapshot.data![0];
                                    }
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      child: DropdownButtonHideUnderline(
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: GradientColors.pink),
                                                borderRadius: BorderRadius.circular(25),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.57),
                                                      //shadow for button
                                                      blurRadius: 5) //blur radius of shadow
                                                ]),
                                            child: DropdownButton2(
                                              items: snapshot.data!
                                                  .map((items) => DropdownMenuItem<GenderModel?>(
                                                value: items,
                                                child: Text(
                                                  items.genderName.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                                  .toList(),
                                              value: model1,
                                              onChanged: (value) {
                                                isGetGender = false;
                                                setState(() {
                                                  model1 = value!;
                                                });
                                              },
                                              icon: Container(
                                                margin: EdgeInsets.only(right: 10),
                                                child: const Icon(
                                                  Icons.keyboard_arrow_down_rounded,color: Colors.white,
                                                ),
                                              ),
                                              buttonDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(14),
                                              ),
                                              dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(24),
                                                  color: Colors.pink
                                              ),
                                            ),
                                          )),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                future: isGetGender ? myDatabase.getGenderFromTbl() : null,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 190,
                              child: FutureBuilder<List<ReligionModel>>(
                                builder: (context, snapshot) {
                                  if (snapshot != null && snapshot.hasData) {
                                    if (isGetReligion) {
                                      model2 = snapshot.data![0];
                                    }
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      child: DropdownButtonHideUnderline(
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: GradientColors.pink),
                                                borderRadius: BorderRadius.circular(25),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.57),
                                                      //shadow for button
                                                      blurRadius: 5) //blur radius of shadow
                                                ]),
                                            child: DropdownButton2(
                                              items: snapshot.data!
                                                  .map((items) => DropdownMenuItem<ReligionModel?>(
                                                value: items,
                                                child: Text(
                                                  items.religionName.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                                  .toList(),
                                              value: model2,
                                              onChanged: (value) {
                                                isGetReligion = false;
                                                setState(() {
                                                  model2 = value!;
                                                });
                                              },
                                              icon: Container(
                                                margin: EdgeInsets.only(right: 10),
                                                child: const Icon(
                                                  Icons.keyboard_arrow_down_rounded,color: Colors.white,
                                                ),
                                              ),
                                              buttonDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(14),
                                              ),
                                              dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(24),
                                                  color: Colors.pink
                                              ),
                                            ),
                                          )),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                                future: isGetReligion ? myDatabase.getReligionFromTbl() : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,left: 20),
                          child: Row(
                            children: [
                              Text('Select Your Birthday : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              InkWell(
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                      alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .circular(25),
                                      color: Colors.pink
                                    ),
                                      child: Text(getFormattedDateTime(selectedDate),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                  onTap: () {
                                    _pickDateDialog();
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (model.CityID == -1) {
                                showAlertDialog(context);
                              } else {
                                myDatabase.upsertIntoUserTable(
                                    cityId: model.CityID,
                                    userName: nameController.text.toString(),
                                    dob: selectedDate.toString(),
                                    gender: model1.genderID,
                                    mobileNo: mobileController.text.toString(),
                                    religion: model2.religionID,
                                    height: heightController.text.toString(),
                                    userId: widget.model != null
                                        ? widget.model!.UserID
                                        : -1);
                              }
                            }
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              fixedSize: const Size(150, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        )));
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Please Select City."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Age is below 18 years."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (DateTime.now().difference(pickedDate!) < Duration(days: 6570) ||
          pickedDate == null) {
        return showAlertDialog2(context);
      }
      setState(() {
        selectedDate = pickedDate!;
      });
    });
  }

  String getFormattedDateTime(dateToFormat) {
    DateFormat formatter = DateFormat.yMMMd();
    final String formatted = formatter.format(dateToFormat);
    if (dateToFormat != null) {
      return formatted;
    } else {
      return DateFormat('dd-MM-yyyy').format(DateTime.now());
    }
  }
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.pinkAccent,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }
}
