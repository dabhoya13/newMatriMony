import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newmatrimony/login.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                    child: Image.asset(
                        'assets/images/bg_matrimony_prelogin.jpg',
                        fit: BoxFit.cover,
                        color: Color.fromRGBO(255, 255, 255, 0.6901960784313725),
                        colorBlendMode: BlendMode.modulate)),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Text(
                      'INDIA\'S\n MOST TRUSTED\n MATRIMONY BRAND',
                      style: TextStyle(
                          fontSize: 28, fontFamily: 'MerriweatherBoldItalic'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(90, 170, 90, 570),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                  )),
                  child: Text(
                    'BY THE TRUST BRAMD 2023',
                    style: TextStyle(
                        fontFamily: 'MerriweatherBoldItalic',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                          color: Colors.pink,
                          child: Container(
                            margin: EdgeInsets.only(left: 55),
                            child: Row(
                              children: [
                                button('LOGIN'),
                                Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    )),
                Expanded(
                    child: Container(
                        color: Colors.blue,
                        child: Container(
                          margin: EdgeInsets.only(left: 55),
                          child: Row(
                            children: [
                              button('SIGN UP'),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ))),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget button(String title) {
    return (TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ));
  }
}
