// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Controller/AuthController.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

import 'package:speedy_phone_fix/Widgets/AuthFormFiled.dart';

//aleen code
import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});
  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyPageState();
}

class _SignInScreenBodyPageState extends State<SignInScreenBody>
    with SingleTickerProviderStateMixin {
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

  AuthController authController = Get.put(AuthController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Welcome!',
      //       style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold,
      //       fontSize: 24))),
      //   bottom: PreferredSize(
      //       child: Padding(
      //         padding: EdgeInsets.only(left:15, bottom: 5, right: 15, top:5),
      //         child: Container(
      //           width: double.infinity,
      //           height: 50,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: FormBackGraund,
      //           ),
      //           child: TabBar(
      //             controller: _tabController,
      //             tabs: [
      //               Container(
      //                 child: Padding(
      //                   padding: EdgeInsets.only(left:15, bottom: 0, right: 15, top:0),
      //                   child: Center(
      //                     child: Text(
      //                       'Sign Up',
      //                         style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold,
      //                             fontSize: 20)
      //                     ),
      //                   ),
      //                 ),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(30),
      //                   color: Colors.white,
      //                 ),
      //                 height: 40,
      //               ),
      //                Text('Sign In',
      //                     style: TextStyle(color: TextGrey, fontWeight: FontWeight.bold,
      //                         fontSize: 20)
      //                 ),
      //             ],
      //               indicatorColor: Colors.transparent,
      //           ),
      //         ),
      //       ),
      //       preferredSize: Size.fromHeight(kToolbarHeight)
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthFormField(
              prefixIcon: Icon(
                Icons.phone,
                color: BlueColor,
              ),
              hint: 'Phone Number',
            ),
            SizedBox(
              height: 20.0,
            ),
            AuthFormField(
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                color: BlueColor,
              ),
              hint: 'Password',
              suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: LightGrey,
                    ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('OR',
                    style: TextStyle(
                        color: BlueColor, fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 8.0,
                left: 8.0,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: BlueColor),
                child: TextButton(
                    child: Text("Sign In",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                    onPressed: () {
                      Get.toNamed(AppRoutes.homescreen);
                    }),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Reset Your Password',
                    style: TextStyle(
                      color: BlueColor, fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          BlueColor, // You can adjust the line color
                      decorationThickness: 1.0,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
