// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Utils/AppStyle.dart';
import 'SignIn/SignInScreen.dart';
import 'SignUp/SignUpScreen.dart';

class AuthTabBar extends StatefulWidget {
  const AuthTabBar({super.key});
  @override
  State<AuthTabBar> createState() => _AuthTabBarPageState();
}

class _AuthTabBarPageState extends State<AuthTabBar>
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

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Welcome!',
                style: TextStyle(
                    color: BlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: FormBackGraund,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: TabBar(
                        unselectedLabelColor: BorderGrey,
                        labelColor: BlueColor,
                        indicatorColor: Colors.transparent,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.0, right: 24.0),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  // fontWeight: FontWeight.bold,
                                  // color: BlueColor,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, right: 12.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  // fontWeight: FontWeight.bold,
                                  // color: BlueColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    SignInScreen(),
                    SignUpScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
