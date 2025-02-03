import 'package:codeedex_task/bloc/product_detail_cubit/product_dtl_cubit.dart';
import 'package:codeedex_task/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDtlCubit, ProductDtlState>(
      builder: (context, state) {
        List<Product> list = state is ProductDtlLoaded ? state.productList : [];
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list.first.price,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp),
                  ),
                  Container(
                    height: 40,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                    decoration: const BoxDecoration(
                        color: Color(0xff525ed8),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: SizedBox(
                      height: 40.h, child: Image.network(list.first.partImage)),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  list.first.description,
                  style: TextStyle(fontSize: 17.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                RatingBar.builder(
                  initialRating: double.parse(list.first.productRating),
                  minRating: 1,
                  itemSize: 20,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
