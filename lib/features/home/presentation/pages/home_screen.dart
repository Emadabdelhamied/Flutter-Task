import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../cubit/home_controller.dart';
import '../widgets/address_card.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_header.dart';
import '../widgets/product_card.dart';
import '../widgets/product_widget.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarHome(),
              SizedBox(
                height: 20.h,
              ),
              const SearchField(),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: AddressCard(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const HomeHeader(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ProductCard(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const HomeHeader(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ProductWidget(
                      product: controller.products[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: red.withOpacity(0.3),
                  image: const DecorationImage(
                    image: AssetImage(content),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
