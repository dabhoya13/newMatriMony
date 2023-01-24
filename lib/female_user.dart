import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:newmatrimony/add_user.dart';
import 'package:newmatrimony/database.dart';
import 'package:newmatrimony/models/user_model.dart';

class FemaleUser extends StatefulWidget {
  @override
  State<FemaleUser> createState() => _FemaleUserPageState();
}

class _FemaleUserPageState extends State<FemaleUser> {
  MyDatabase db = MyDatabase();
  List<UserModel> localList = [];
  List<UserModel> searchList = [];
  List<UserModel> favouriteList = [];
  bool isGetData = true;
  FocusNode myFocusNode = new FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
              padding: EdgeInsets.only(left: 20),
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
                                      color: Colors.transparent,
                                      elevation: 5,
                                      borderOnForeground: true,
                                      child: (Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            gradient: LinearGradient(
                                                colors: GradientColors.overSun,
                                                begin: Alignment.topLeft)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      searchList![index]
                                                          .UserName
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.redAccent,
                                                          fontSize: 30),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      searchList![index].DOB.toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey.shade500,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                        'Mobile no: ${searchList![index].MobileNo.toString()}',
                                                        style: TextStyle(fontSize: 20)),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(left: 50),
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                searchList[index]
                                                                    .FavouriteUser =
                                                                !searchList[index]
                                                                    .FavouriteUser;
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'Add To Favourite',
                                                                  style: TextStyle(
                                                                      color: Colors.red,
                                                                      fontSize: 20),
                                                                ),
                                                                Icon(
                                                                  searchList[index]
                                                                      .FavouriteUser
                                                                      ? Icons.favorite
                                                                      : Icons
                                                                      .favorite_border_outlined,
                                                                  color: Colors.red,
                                                                  size: 30,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              showAlertDialog(
                                                                  context, index);
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'Delete User',
                                                                  style: TextStyle(
                                                                      color: Colors.red,
                                                                      fontSize: 20),
                                                                ),
                                                                Icon(
                                                                  Icons.delete,
                                                                  color: Colors.red,
                                                                  size: 30,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                  future: isGetData ? db.getFemaleUserFromTbl(): null),
            ],
          )),
    ));
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
