import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:newmatrimony/add_user.dart';
import 'package:newmatrimony/favourite_user.dart';
import 'package:newmatrimony/female_user.dart';
import 'package:newmatrimony/male_user.dart';
import 'package:newmatrimony/userlist.dart';

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
                )
              ),
              child:Container()
            ),
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
                                      Icon(
                                        Icons.add_box,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Text(
                                        'Add',
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
                        child:Image.asset('assets/images/giphy.gif'),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,left: 20),
                    child: Row(
                      children: [
                        txt('Select Categories'),
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
                  Container(
                    child: Row(
                      children: [
                        avtar('assets/images/couple.png'),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserListPage(),));
                            },
                            child: button("All Users")),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        avtar('assets/images/groom.png'),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaleUser(),));
                            },
                            child: button("Find Groom")),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        avtar('assets/images/bride.png'),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FemaleUser(),));
                          },
                          child: button("Find Bride"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        avtar('assets/images/favorite.png'),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteUser(),));
                          },
                          child: button("All Favourite"),
                        ),
                      ],
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
      style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Corporate S Bold.otf'),
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

  Widget avtar(img)
  {
    return(
        Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal,
            child: CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 50,
            ),
          ),
        )
    );
  }
  Widget button(String name)
  {
    return(
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: GradientColors.harmonicEnergy,
              ),
            ),
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  margin:EdgeInsets.only(left: 20),
                  child: txt(name),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,))
              ],
            ))
    );
  }
}
