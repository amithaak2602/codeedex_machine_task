import 'package:codeedex_task/bloc/product_cubit/product_cubit.dart';
import 'package:codeedex_task/data/api_service/api_service.dart';
import 'package:codeedex_task/screen/home_screen/widget/all_product_card.dart';
import 'package:codeedex_task/screen/home_screen/widget/part_category.dart';
import 'package:codeedex_task/screen/home_screen/widget/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getProduct();
    super.initState();
  }

  void getProduct() async {
    await context.read<ProductCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Products",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 16.sp),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    ),
                  ),
                )),
            SizedBox(
              height: 2.h,
            ),
            Container(
                height: 22.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "assets/images/card.png",
                      ),
                    ))),
            PartCategory(),
            SizedBox(
              height: 2.h,
            ),
            TopCategories(),
            AllProductCard()
          ],
        ),
      )),
    );
  }
}
