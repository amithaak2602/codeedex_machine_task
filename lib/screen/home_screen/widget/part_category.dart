import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartCategory extends StatelessWidget {
  const PartCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  height: 15.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          "assets/images/bike_part.png",
                        ),
                      ))),
              Text(
                "Bike Spare Parts",
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  height: 15.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          "assets/images/accessories.png",
                        ),
                      ))),
              Text(
                "Accessories",
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              )
            ],
          ),
        ],
      ),
    );
  }
}
