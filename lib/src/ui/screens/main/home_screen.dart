import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/src/ui/screens/main/dashboard_screen.dart';
import 'package:recipe_app/src/ui/screens/upload/step1_screen.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List pages
    List<Widget> _pages = [
      DashboardScreen(),
      Step1Screen(),
      Page3(),
      Page4(),
      Page5(),
    ];
    final navC = Get.put(NavbarController());
    return Obx(
      () => Scaffold(
        body: _pages.elementAt(navC.index.value),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            navC.setIndex(2);
          },
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: SvgPicture.asset(AssetIcons.scan),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            selectedFontSize: 12,
            currentIndex: navC.index.value,
            onTap: (index) {
              navC.setIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: SvgPicture.asset(
                  AssetIcons.home,
                  color: navC.index.value == 0
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Upload",
                icon: SvgPicture.asset(
                  AssetIcons.edit,
                  color: navC.index.value == 1
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Scan",
                icon: Icon(
                  Icons.cancel,
                  color: Colors.transparent,
                ),
              ),
              BottomNavigationBarItem(
                label: "Notification",
                icon: SvgPicture.asset(
                  AssetIcons.notification,
                  color: navC.index.value == 3
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: SvgPicture.asset(
                  AssetIcons.profile,
                  color: navC.index.value == 4
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarController extends GetxController {
  var index = 0.obs;
  void setIndex(int page) => index.value = page;
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Home')));
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Upload')));
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Scan')));
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Notification')));
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Profile')));
}
