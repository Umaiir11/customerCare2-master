import 'dart:ui';

import 'package:customercare/MVVM/View/VwLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../ViewModel/VmDrawer.dart';
import '../testui.dart';
import 'VwDrawerHome.dart';
import 'VwDrawerMenu.dart';

int currentIndex = 0;

class VwDrawer extends StatefulWidget {
  const VwDrawer({Key? key}) : super(key: key);

  @override
  State<VwDrawer> createState() => _VwDrawerState();
}

class _VwDrawerState extends State<VwDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;

  }

  final l_VmDrawer = Get.put(VmDrawer());
  bool isLoading = false;

  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: setScreenIndex(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ZoomDrawer(
            menuScreen: VwDrawerMenu(
              setIndex: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            mainScreen: snapshot.data!,
            showShadow: true,
            borderRadius: 30,
            menuBackgroundColor: Colors.lightBlue,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.bounceIn,
            angle: -12.0,
            slideWidth: MediaQuery.of(context).size.width * .65,
          );
        } else {
          return Stack(
            children: [
              VwDrawerHome(),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<Widget> setScreenIndex() async {
    switch (currentIndex) {
      case 0:
        return VwDrawerHome();
      case 1:

          return Stack(
            children: [
              VwDrawerHome(),

              if ( await l_VmDrawer.Fnc_AccLedgerList())
                VwAccountLedger()
              else
                Container()
            ],
          );


      case 2:
        return Stack(
          children: [
            VwDrawerHome(),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            FutureBuilder<bool>(
              future: l_VmDrawer.Fnc_PendingChequesList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFF1A1A3F),
                      rightDotColor: const Color(0xFFEA3799),
                      size: 40,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!) {
                    return VwLogin();
                  } else {
                    Get.snackbar(
                      "Failed to load data",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      colorText: Colors.white,
                    );

                    //the FutureBuilder requires a widget to be returned in all possible cases. Since there's nothing to show in the else block, returning an empty Container is a good way to handle that case. It doesn't affect the UI since it's an empty container.
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),
          ],
        );
      case 3:
        return Stack(
          children: [
            VwDrawerHome(),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            FutureBuilder<bool>(
              future: l_VmDrawer.Fnc_PendingSaleOrderList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFF1A1A3F),
                      rightDotColor: const Color(0xFFEA3799),
                      size: 40,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!) {
                    return VwLogin();
                  } else {
                    Get.snackbar(
                      "Failed to load data",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      colorText: Colors.white,
                    );

                    //the FutureBuilder requires a widget to be returned in all possible cases. Since there's nothing to show in the else block, returning an empty Container is a good way to handle that case. It doesn't affect the UI since it's an empty container.
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),
          ],
        );
      case 4:
        return Stack(
          children: [
            VwDrawerHome(),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            FutureBuilder<bool>(
              future: l_VmDrawer.Fnc_ItemQueryList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: const Color(0xFF1A1A3F),
                      rightDotColor: const Color(0xFFEA3799),
                      size: 40,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!) {
                    return VwLogin();
                  } else {
                    Get.snackbar(
                      "Failed to load data",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      colorText: Colors.white,
                    );

                    //the FutureBuilder requires a widget to be returned in all possible cases. Since there's nothing to show in the else block, returning an empty Container is a good way to handle that case. It doesn't affect the UI since it's an empty container.
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),
          ],
        );
      case 5:
        return VwLogin();

      default:
        return VwDrawerHome();
    }
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(Icons.menu));
  }
}
