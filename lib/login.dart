import 'package:flutter/material.dart';
import 'package:newmatrimony/Screen1.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/Wedding-Photographer-3.jpg',
                  fit: BoxFit.cover,
                  color: Color.fromRGBO(54, 54, 51, 1.0),
                  colorBlendMode: BlendMode.modulate,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(top: 175.0),
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 55.0),
                            child: const Text(
                              'Hello There! \nWelcome Back',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontFamily: 'MerriweatherBoldItalic',
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          textField('Username','Enter Username'),
                          SizedBox(height: 15,),
                          textField('Password' ,'Enter Password'),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                fixedSize: const Size(320, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
                            },
                            child: const Text('Login'),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 12,top: 15),
                              alignment: Alignment.bottomRight, child: const Text('Forgot Password?',style: TextStyle(color: Colors.white,fontSize: 15),)),
                          Container(
                              margin: const EdgeInsets.only(top:22),
                              alignment: Alignment.center, child: const Text('--------------------OR--------------------',style: TextStyle(color: Colors.white),)),
                          Container(
                            margin: EdgeInsets.only(top: 25,right: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 40.0,
                                  // padding: const EdgeInsets.fromLTRB(0,15,8,0),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.facebook,
                                        color: Colors.white,
                                      ),
                                      text(' Login With Facebook'),

                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: ()
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 40.0,
                                    padding: const EdgeInsets.fromLTRB(0,0,0,10),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 215, 31, 18),
                                    ),

                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        text('Login With Google '),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15,left: 55),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: text('Don\'t have an account?'),),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      alignment: Alignment.center,
                                      child: Text('Register Free',style: TextStyle(color: Colors.yellow),)),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textField(hintText,labeltxt) {
    return (Container(
        margin: const EdgeInsets.only(left: 10.0,top: 2, right: 10.0),
        height: 40.0,
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: labeltxt,
                  hintText: hintText,
                  labelStyle: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),
                  border: myinputborder(), //normal border
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(), //focused border
                  // set more border style like disabledBorder
                )
            ))));
  }
  Widget button(String title) {
    return (TextButton(
      onPressed: () {},
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20,),
      ),
    ));
  }
  Widget text(String text)
  {
    return(
        Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)
    );
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
