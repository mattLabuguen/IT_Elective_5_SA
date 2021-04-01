import 'package:flutter/material.dart';
import 'package:flutter_summative/fakestore.dart';
import 'package:flutter_summative/shared/constants.dart';
import 'package:flutter_summative/viewitem.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes:{
    '/': (context) => LoginScreen(),
    '/fakestore' : (context) => FakeStoreScreen(),
    '/view' : (context) => ViewItemScreen(id:0)
  }
));

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[
                  Colors.white,
                  greyColors[1]
                ]
              )
            ),
          ),
          Positioned(
            top: 30,
            bottom: 30,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  Colors.white,
                  greyColors[2]
                ]
              ),
              boxShadow: [
                  BoxShadow(
                    color: greyColors[3], 
                    spreadRadius: 4,
                  )
                ]
              ),
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('center_picture.png')
                  ),

                  Text(
                    "Welcome back!",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Log in to your existing Fakestore account",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey
                        ),
                    ),
                  ),

                  SizedBox(height: 35),

                  TextField(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: accentColors[2]
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    )
                  ),

                  SizedBox(height: 10),

                  TextField(
                    obscureText: true,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: accentColors[2]
                      )
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    )
                  ),

                  SizedBox(height:10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password?", 
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: accentColors[5]
                          )
                        )
                      ),
                    ],
                  ),
                  
                  SizedBox(height:20),
                  // LOGIN BUTTON
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical:15, horizontal: 70),
                    onPressed:(){
                      Navigator.pushNamed(context, '/fakestore');
                    },
                    color: accentColors[1],
                    child: Text(
                      "LOG IN",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        )
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),

                  SizedBox(height:30),
                  Text(
                    "Or connect using", 
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.grey
                      )
                    )
                  ),

                  SizedBox(height:10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(vertical:10, horizontal: 15),
                        onPressed:(){},
                        color: accentColors[3],
                        child: Row(
                          children: [
                            Image(
                              width:10,
                              image: AssetImage('facebook.png')
                            ),
                            SizedBox(width:8),
                            Text(
                              "Facebook",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                )
                              )
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),

                      SizedBox(width:10),

                      FlatButton(
                        padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
                        onPressed:(){},
                        color: accentColors[4],
                        child: Row(
                          children: [
                            Image(
                              width:10,
                              image: AssetImage('google.png')
                            ),
                            SizedBox(width:8),
                            Text(
                              "Google",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                )
                              )
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ],
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      Text(
                        "Sign Up",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: accentColors[2]
                          )
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

