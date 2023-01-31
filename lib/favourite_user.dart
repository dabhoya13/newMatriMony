import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:intl/intl.dart';
import 'package:newmatrimony/Database/database.dart';
import 'package:newmatrimony/add_user.dart';
import 'package:newmatrimony/models/gender_model.dart';
import 'package:newmatrimony/models/user_model.dart';
import 'package:newmatrimony/user_list.dart';


class FavouriteUser extends StatefulWidget {
  @override
  State<FavouriteUser> createState() => _FavouriteUser();
}

class _FavouriteUser extends State<FavouriteUser> {
  MyDatabase db = MyDatabase();
  List<UserModel> localList = [];
  List<UserModel> searchList = [];
  List<GenderModel> genderList = [];
  bool isGetData = true;
  FocusNode myFocusNode = new FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.copyPasteAssetFileToRoot().then((value) {
      db.getUserListFromTbl();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, // <-- SEE HERE
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.freshMilk, begin: Alignment.topLeft),
            ),
          ),
          elevation: 10,
          title: Container(
              margin: EdgeInsets.only(left: 100),
              padding: EdgeInsets.only(left: 10),
              height: 70,
              width: 70,
              child: Tab(
                  icon: new Image.asset(
                    "assets/images/marriage.png",
                  )))),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: GradientColors.awesomePine,
                        begin: Alignment.topLeft)),
                child: Container(),
              ),
              FutureBuilder<List<UserModel>>(
                  builder: (context, snapshot) {
                    if (snapshot != null && snapshot.hasData) {
                      if (isGetData) {
                        localList.addAll(snapshot.data!);
                        searchList.addAll(localList);
                      }
                      isGetData = false;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  colors: GradientColors.darkPink,
                                  begin: Alignment.topLeft),
                            ),
                            child: TextField(
                              focusNode: myFocusNode,
                              decoration: InputDecoration(
                                labelText: "Search Users",
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.white),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                enabledBorder: myinputborder(),
                              ),
                              controller: controller,
                              onChanged: (value) {
                                searchList.clear();
                                for (int i = 0; i < localList.length; i++) {
                                  if (localList[i]
                                      .UserName
                                      .toLowerCase()
                                      .contains(value)) {
                                    searchList.add(localList[i]);
                                  }
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AddUser(model: searchList![index]),
                                    ));
                                  },
                                  child: Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                      color: const Color.fromRGBO(34, 33, 91, 1),
                                      borderOnForeground: true,
                                      child: (Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(left: 10),
                                                      child: Image.asset(
                                                        searchList[index].Gender
                                                        as int ==
                                                            1
                                                            ? "assets/images/groom.png"
                                                            : searchList[index].Gender
                                                        as int ==
                                                            2
                                                            ? "assets/images/bride.png"
                                                            : "assets/images/wedding.png",
                                                        height: 60,
                                                        width: 60,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        searchList![index]
                                                            .UserName
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.redAccent,
                                                            fontSize: 30),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      searchList[index].DOB.toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey.shade500,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                        'Mobile no: ${searchList![index].MobileNo.toString()}',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white)),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      padding:
                                                      EdgeInsets.only(left: 25),
                                                      child: Container(
                                                        margin:
                                                        EdgeInsets.only(right: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              searchList[index].Gender
                                                              as int ==
                                                                  1
                                                                  ? "Male"
                                                                  :  "Female",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              searchList[index].Religion
                                                              as int ==
                                                                  1
                                                                  ? "Hindu"
                                                                  : searchList[index]
                                                                  .Religion
                                                              as int ==
                                                                  2
                                                                  ? "Muslim"
                                                                  : "Jain",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Delete User',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 20),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                                context: context,
                                                                builder:
                                                                    (BuildContext contex) {
                                                                  return AlertDialog(
                                                                    title: Text("Delete"),
                                                                    content: Text(
                                                                        "Do you want to delete this record"),
                                                                    actions: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          ElevatedButton(
                                                                            onPressed:
                                                                                () async {
                                                                              int deletedUserID =
                                                                              await db.deleteUserFromUserTable(
                                                                                  localList[index]
                                                                                      .UserID);
                                                                              if (deletedUserID >
                                                                                  0) {
                                                                                localList
                                                                                    .removeAt(
                                                                                    index);
                                                                              }
                                                                              ;
                                                                              setState(() {
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) =>
                                                                                            UserList()));
                                                                              });
                                                                            },
                                                                            child: Text(
                                                                                "Delete"),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 5,
                                                                          ),
                                                                          ElevatedButton(
                                                                            onPressed: () {
                                                                              Navigator.of(
                                                                                  context)
                                                                                  .pop();
                                                                            },
                                                                            child:
                                                                            Text("No"),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Icon(
                                                            Icons.delete_rounded,
                                                            color: Colors.red,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            Icon(
                                              Icons.keyboard_arrow_right_outlined,
                                              color: Colors.grey.shade400,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                );
                              },
                              itemCount: searchList!.length,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return (Center(
                        child: Text('No User Found'),
                      ));
                    }
                  },
                  future: isGetData ? db.getFavouriteUserFromTbl() : null),
            ],
          )),
    );
  }

  showAlertDialog(BuildContext context, index) {
    // set up the button
    Widget YesButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        int deletedUserID =
        await db.deleteUserFromUserTable(localList[index].UserID);
        if (deletedUserID > 0) {
          localList.removeAt(index);
        }
        Navigator.of(context, rootNavigator: true).pop('dialog');
        setState(() {});
      },
    );

    Widget NoButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Are You Sure You Want to Delete."),
      actions: [YesButton, NoButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }
}
