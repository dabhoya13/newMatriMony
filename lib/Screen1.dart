import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:newmatrimony/add_user.dart';
import 'package:newmatrimony/favourite_user.dart';
import 'package:newmatrimony/female_user.dart';
import 'package:newmatrimony/male_user.dart';
import 'package:newmatrimony/user_list.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return (Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: GradientColors.ladyLips,
            )),
            child: Container()),
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.darkPink,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: Icon(Icons.menu_rounded, size: 35)),
                      Container(
                          padding: EdgeInsets.only(top: 15, left: 300),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddUser(
                                    model: null,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/add_user.png',
                                    width: 35,
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.yellowAccent,fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 80),
                    width: 250,
                    height: 250,
                    child: Image.asset('assets/images/giphy.gif'),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Text(
                      'Select Categories',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Merriweather-BoldItalic.ttf'),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 70),
                      child: CircleAvatar(
                        radius: 30,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/engagement-ring.png'),
                          radius: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top:30),
              //   child: Row(
              //     children: [
              //       avtar('assets/images/couple.png'),
              //       InkWell(
              //           onTap: (){
              //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserList(),));
              //           },
              //           child: button("All Users")),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 40),
              //   child: Row(
              //     children: [
              //       avtar('assets/images/groom.png'),
              //       InkWell(
              //           onTap: (){
              //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaleUserPage(),));
              //           },
              //           child: button("Find Groom")),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 40),
              //   child: Row(
              //     children: [
              //       avtar('assets/images/bride.png'),
              //       InkWell(
              //         onTap: (){
              //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => FemaleUserPage(),));
              //         },
              //         child: button("Find Bride"),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 40),
              //   child: Row(
              //     children: [
              //       avtar('assets/images/favorite.png'),
              //       InkWell(
              //         onTap: (){
              //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteUser(),));
              //         },
              //         child: button("All Favourite"),
              //       ),
              //     ],
              //   ),
              // )
              // Container(
              //   padding: EdgeInsets.only(top: 40,bottom: 20),
              //   child: Image.asset('assets/images/unnamed.webp',scale: 2,),
              // )
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                              borderRadius: BorderRadius.circular(25),
                              splashColor: Color.fromRGBO(65, 94, 182, 1),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserList()),
                                );
                              },
                              child: buttons(
                                  Color.fromRGBO(238, 247, 254, 1),
                                  'assets/images/couple.png',
                                  'All Users',
                                  Color.fromRGBO(187, 78, 78, 1.0))),
                        ),
                        SizedBox(
                          width: 9.5,
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color.fromRGBO(255, 177, 16, 1),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaleUserPage()),
                              );
                            },
                            child: buttons(
                                Color.fromRGBO(255, 251, 236, 1),
                                'assets/images/groom.png',
                                'Find Groom',
                                Color.fromRGBO(16, 36, 255, 1.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 9.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Color.fromRGBO(172, 64, 64, 1),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FavouriteUser()),
                                );
                              },
                              child: buttons(
                                  Color.fromRGBO(254, 238, 238, 1),
                                  'assets/images/favorite.png',
                                  'Favourite',
                                  Color.fromRGBO(232, 62, 62, 1.0))),
                        ),
                        SizedBox(
                          width: 9.5,
                        ),
                        Expanded(
                          child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Color.fromRGBO(35, 176, 176, 1),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FemaleUserPage()),
                                );
                              },
                              child: buttons(
                                  Color.fromRGBO(254, 238, 238, 1),
                                  'assets/images/bride.png',
                                  'Find Bride',
                                  Color.fromRGBO(23, 180, 180, 1.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: Image.asset(
                  'assets/images/unnamed.webp',
                  scale: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }

  Widget txt(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Corporate S Bold.otf'),
    );
  }

  Widget txt2(String txt) {
    return Text(
      txt,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color.fromARGB(255, 173, 124, 67)),
    );
  }

  Widget buttons(bgColor, imgAssets, buttonName, color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: GradientColors.glassWater,
        ),
      ),
      child: Card(
        elevation: 5,
        color: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: GradientColors.blessingGet,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Image.asset(
                    imgAssets,
                    width: 55,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 20,
                      color: color,
                      fontFamily: 'Gilroy-Light',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(String name) {
    return (Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: GradientColors.bloodyMary,
          ),
        ),
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: txt(name),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ))
          ],
        )));
  }
}
