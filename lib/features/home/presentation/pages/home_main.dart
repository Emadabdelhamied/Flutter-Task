import '../../../favorites/presentation/pages/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/empty_screen.dart';
import '../../../../core/utils/icons.dart';
import '../../../cart/presentation/cubit/cart_controller.dart';
import '../../../cart/presentation/pages/cart_screen.dart';
import 'home_screen.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const EmptyScreen(),
    CartScreen(),
    FavoriteScreen(),
    const EmptyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          selectedLabelStyle:
              TextStyles.textViewRegular10.copyWith(color: lightGrey),
          unselectedLabelStyle:
              TextStyles.textViewRegular10.copyWith(color: lightGrey),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                homeIcon,
                height: 30.h,
                color: _selectedIndex == 0 ? red : lightGrey,
              ),
              label: "Grocery",
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                bellIcon,
                height: 30.h,
                color: _selectedIndex == 1 ? red : lightGrey,
              ),
              label: "News",
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 70.h,
                width: 80.h,
                decoration:
                    const BoxDecoration(color: red, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        cartIcon,
                        height: 30.h,
                        fit: BoxFit.scaleDown,
                        color: _selectedIndex == 2 ? white : lightGrey,
                      ),
                      Obx(
                        () => Text(
                          '${cartController.productsTotalPrice ?? 0.00}\$',
                          style:
                              TextStyles.textViewBold12.copyWith(color: white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              label: "",

              // backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  heartIcon,
                  height: 30.h,
                  color: _selectedIndex == 3 ? red : lightGrey,
                ),
                label: "Favorites"
                // backgroundColor: Colors.purple,
                ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                walletIcon,
                height: 30.h,
                color: _selectedIndex == 4 ? red : const Color(0xff939393),
              ),
              label: "Cart",
              // backgroundColor: Colors.purple,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: red,
          unselectedItemColor: const Color(0xff939393),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
