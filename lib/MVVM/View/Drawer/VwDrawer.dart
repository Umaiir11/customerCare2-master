import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../ViewModel/VmAccLedger.dart';
import '../../ViewModel/VmDrawer.dart';
import '../../ViewModel/VmItemQuery.dart';
import '../../ViewModel/VmPendingCheques.dart';
import '../../ViewModel/VmPendingSaleOrder.dart';
import '../VwAccLedger.dart';
import '../VwItemQuery.dart';
import '../VwPendingCheques.dart';
import '../VwPendingSaleOrder.dart';
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
  final l_VmAccLedger = Get.put(VmAccLedger());
  final l_VmPendingCheques = Get.put(VmPendingCheques());
  final l_VmPendingSaleOrder = Get.put(VmPendingSaleOrder());
  final l_VmItemQueryList = Get.put(VmItemQueryList());
  bool isLoading = false;

  @override
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
              const VwDrawerHome(),
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
        return const VwDrawerHome();
      case 1:
        return Stack(
          children: [
            const VwDrawerHome(),
            if (await l_VmAccLedger.Fnc_AccLedgerList()) const VwAccountLedger() else Container()
          ],
        );
      case 2:
        return Stack(
          children: [
            const VwDrawerHome(),
            if (await l_VmPendingCheques.Fnc_PendingChequesList()) const VwPendingCheques() else Container()
          ],
        );
      case 3:
        return Stack(
          children: [
            const VwDrawerHome(),
            if (await l_VmPendingSaleOrder.Fnc_PendingSaleOrderList()) const VwPendingSaleOrder() else Container()
          ],
        );
      case 4:
        return Stack(
          children: [
            const VwDrawerHome(),
            if (await l_VmItemQueryList.Fnc_ItemQueryList()) const VwItemQuery() else Container()
          ],
        );

      default:
        return const VwDrawerHome();
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
        icon: const Icon(Icons.menu));
  }
}
