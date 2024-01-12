import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../block/Text_feld.dart';
import '../block/ginrat_buttom.dart';

class LogenScreens extends StatefulWidget {
  LogenScreens({Key? key}) : super(key: key);

  @override
  State<LogenScreens> createState() => _LogenScreensState();
}

class _LogenScreensState extends State<LogenScreens>
    with SingleTickerProviderStateMixin {
  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController CreateFullName = TextEditingController();
  TextEditingController CreateE_mail = TextEditingController();
  TextEditingController Createpassword = TextEditingController();
  TextEditingController CreateConfirmPassword = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser == null){
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator .of(context).pushNamedAndRemoveUntil("buttom_Navegat", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              Container(
                height: 150,
                width: 200,
                child: Image.asset('images/iconebhoto.jpg'),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,

                        // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10)),
                child: ButtonsTabBar(
                  controller: _tabController,
                  // Customize the appearance and behavior of the tab bar
                  backgroundColor: Colors.red,

                  //borderWidth: 2,
                  //borderColor: Colors.black,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  // Add your tabs here
                  tabs: [
                    Tab(
                      child: Container(
                        width: 110,
                        height: 60,
                        child: Center(
                            child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 110,
                        height: 60,
                        child: Center(
                            child: Text(
                          'SIGN UP',
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Scaffold(
                      backgroundColor: Colors.white,
                      body: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Center(
                            child: textfeld(
                              hint: 'NAME',
                              mycontroller: UserName,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: textfeld(
                              hint: 'PASSWORD',
                              mycontroller: Password,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 250,
                              ),
                              InkWell(
                                  child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 10),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GeneralButton(
                            lable: 'LOGIN',
                            function: () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: UserName.text,
                                        password: Password.text);
                                Navigator.of(context)
                                    .pushReplacementNamed("buttom_Navegat");
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: 'No user found for that email.',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  ).show();
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc:
                                        'Wrong password provided for that user.',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  ).show();
                                }
                              }
                            },
                            width: 350,
                            hight: 50,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(height: 30,),
                          GeneralButton2(
                            lable: 'LOGIN WITH GOOGLE',

                            function: () {
                              signInWithGoogle();
                            },
                            width: 350,
                            hight: 50,
                            color: Colors.black87,
                            icon: Icons.facebook,
                          )
                        ],
                      ),
                    ),
                    Scaffold(
                      backgroundColor: Colors.white,
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                            Center(
                                child: textfeld(
                                    hint: "Full Name",
                                    mycontroller: CreateFullName)),
                            SizedBox(height: 20,),
                            Center(
                                child: textfeld(
                                    hint: 'E-Mail', mycontroller: CreateE_mail)),
                            SizedBox(height: 20,),

                            textfeld(
                                hint: 'Password', mycontroller: Createpassword),
                            SizedBox(height: 20,),
                            textfeld(
                                hint: 'Confirm Password',
                                mycontroller: CreateConfirmPassword),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Container(
                                  width: 350,
                                  child: CheckboxListTile(
                                    title: Text('I agree all statements in'),
                                    subtitle: Text(
                                      "Terms of service",
                                      style: TextStyle(color: Colors.deepOrange),
                                    ),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            GeneralButton(
                              lable: 'Sign Up',
                              function: () async {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: CreateE_mail.text,
                                    password: Createpassword.text,
                                  );
                                  Navigator.of(context)
                                      .pushReplacementNamed("buttom_Navegat");
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'Dialog Title',
                                      desc: 'The password provided is too weak.',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    ).show();
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'Dialog Title',
                                      desc:
                                          'The account already exists for that email.',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {},
                                    )..show();
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              width: 350,
                              hight: 50,
                              color: Colors.deepOrange,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
