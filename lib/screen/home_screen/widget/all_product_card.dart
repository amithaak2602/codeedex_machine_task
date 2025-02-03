import 'package:codeedex_task/bloc/product_cubit/product_cubit.dart';
import 'package:codeedex_task/bloc/product_detail_cubit/product_dtl_cubit.dart';
import 'package:codeedex_task/data/api_service/api_service.dart';
import 'package:codeedex_task/screen/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProductCard extends StatelessWidget {
  const AllProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial?) {
          return SizedBox(
              width: 6.w,
              height: 3.h,
              child: CircularProgressIndicator(
                color: Colors.blue,
              ));
        } else if (state is ProductLoaded) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Products",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                    itemCount: state.productList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          width: 40.w,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                    state.productList[index].partImage),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await context
                              .read<ProductDtlCubit>()
                              .fetchProductDetail(state.productList[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProductDetailScreen();
                          }));
                        },
                      );
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
