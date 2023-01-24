import 'package:flutter/material.dart';
import 'package:newmatrimony/add_user.dart';
import 'package:newmatrimony/database.dart';
import 'package:newmatrimony/models/user_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MyDatabase db = MyDatabase();
  List<UserModel> localList = [];
  List<UserModel> searchList = [];
  bool isGetData = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: controller,
                onChanged: (value){
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
                decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
                suffixIcon: Icon(Icons.backspace_outlined),
                hintText: 'Search...',
                border: InputBorder.none),
              ),

            ),
          )),
      body: SafeArea(
        child: FutureBuilder<List<UserModel>>(
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
                            child: Card(
                              color: Colors.grey.shade100,
                              elevation: 5,
                              borderOnForeground: true,
                              child: (Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showAlertDialog(context, index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(searchList![index]
                                                .UserName
                                                .toString()),
                                            Text(
                                              searchList![index].DOB.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        )),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          searchList[index].FavouriteUser =
                                          !searchList[index]
                                              .FavouriteUser;
                                        });
                                      },
                                      child: Icon(
                                        searchList[index].FavouriteUser
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: Colors.grey.shade400,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              )),
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
            future: isGetData ? db.getUserListFromTbl() : null),
      ),
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
}