// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';



//aleen code
import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
class AuthTabBar extends StatefulWidget {
  const AuthTabBar({ super.key });
  @override
  State<AuthTabBar> createState() => _AuthTabBarPageState();
}
class _AuthTabBarPageState extends State<AuthTabBar> with SingleTickerProviderStateMixin  {
late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome!',
            style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold,
            fontSize: 24))),
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.only(left:15, bottom: 5, right: 15, top:5),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: FormBackGraund,
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left:15, bottom: 0, right: 15, top:0),
                        child: Center(
                          child: Text(
                            'Sign Up',
                              style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold,
                                  fontSize: 20)
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      height: 40,
                    ),
                     Text('Sign In',
                          style: TextStyle(color: TextGrey, fontWeight: FontWeight.bold,
                              fontSize: 20)
                      ),
                  ],
                    indicatorColor: Colors.transparent,
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            Container(
            // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: BlueColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: BlueColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: BlueColor,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: LightGrey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OR',
                            style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.indigoAccent,),
                      child: TextButton(
                          child: Text(
                              "Submit".toUpperCase(),
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold)
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  )
                              )
                          ),
                          onPressed: () => null
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms of use & privacy policy',
                            style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                  ],
                ),
              ),
          ),
            Container(
              // color: Colors.red,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: BlueColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: BlueColor,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: LightGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'OR',
                          style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold)
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.indigoAccent,),
                    child: TextButton(
                        child: Text(
                            "Submit".toUpperCase(),
                            style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold)
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )
                            )
                        ),
                        onPressed: () => null
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Reset Your Password',
                          style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold)
                      )
                    ],
                  ),
                ],
              ),
            ),],
        ),
      ),
    );
  }
}

