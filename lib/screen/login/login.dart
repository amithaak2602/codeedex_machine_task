import 'package:codeedex_task/data/api_service/api_service.dart';
import 'package:codeedex_task/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoad = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff83c0c1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Welcome Back !",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Log-in",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "E-Mail",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Enter mail id",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Default underline color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0), // Color when focused
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Enter mobile number",
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: 16.sp),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white), // Default underline color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0), // Color when focused
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mobile number is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                isLoad
                    ? Center(
                        child: SizedBox(
                            width: 6.w,
                            height: 3.h,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                      )
                    : GestureDetector(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 0.h),
                          decoration: const BoxDecoration(
                              color: Color(0xff525ed8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () async {
                           if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoad = true;
                          });
                          final result = await ApiService.loginUserAccount();
                          if (result) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                            setState(() {
                              isLoad = false;
                            });
                              }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
