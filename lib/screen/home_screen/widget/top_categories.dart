import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              0.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              "Top Categories",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                spacing: 5.w,
                children: [
                  Column(
                    spacing: 2.h,
                    children: [
                      Container(
                        width: 16.w,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/tier.png",
                          ),
                        ),
                      ),
                      Text(
                        "Tier",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.black54),
                      )
                    ],
                  ),
                  Column(
                    spacing: 2.h,
                    children: [
                      Container(
                        width: 16.w,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/engine.png",
                          ),
                        ),
                      ),
                      Text(
                        "Engine",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.black54),
                      )
                    ],
                  ),
                  Column(
                    spacing: 2.h,
                    children: [
                      Container(
                        width: 16.w,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/helmet.png",
                          ),
                        ),
                      ),
                      Text(
                        "Helmet",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.black54),
                      )
                    ],
                  ),
                  Column(
                    spacing: 2.h,
                    children: [
                      Container(
                        width: 16.w,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/alloy.png",
                          ),
                        ),
                      ),
                      Text(
                        "Alloy",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.black54),
                      )
                    ],
                  ),
                  Column(
                    spacing: 2.h,
                    children: [
                      Container(
                        width: 16.w,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/seat.png",
                          ),
                        ),
                      ),
                      Text(
                        "Seat",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.black54),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
