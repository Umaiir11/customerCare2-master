
import 'dart:typed_data';

import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/ViewModel/VmDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'VwDrawer.dart';

class VwDrawerMenu extends StatefulWidget {
  final ValueSetter setIndex;

  const VwDrawerMenu({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<VwDrawerMenu> createState() => _VwDrawerMenuState();
}

class _VwDrawerMenuState extends State<VwDrawerMenu> {
  @override
  final l_VmDrawer = Get.put(VmDrawer());

  @override
  void initState() {
    super.initState();
   // l_VmDrawer.Fnc_addItem();
    //l_VmDrawer.Pr_DecodeData_Image =
      //  base64.decode(cmGlobalVariables.Pb_UserImage);
   // l_VmDrawer.Fnc_UserAccountQueryList();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ResponsiveWrapper(
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: deviceHeight * 0.120, left: devicewidth * 0.160),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(75)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.shade100.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 17,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: MemoryImage(
                      Uint8List.fromList(l_VmDrawer.Pr_DecodeData_Image!),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 48),
                      child: Text(
                        cmGlobalVariables.Pb_UserName!,
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .5)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 80),
                  child: Text(
                    l_VmDrawer
                        .l_PrAssignedBranchesList![
                    l_VmDrawer.Pr_txtselectedIndex_Text.value]
                        .pr_BranchName,
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30),
                      child: Text(

                        cmGlobalVariables.Pb_UserEmail!,
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .5)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: drawerlist(Icons.home_outlined, "Home", 0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: drawerlist(Icons.account_balance, "Account Ledger", 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: drawerlist(Icons.monetization_on_outlined, "Pending Cheques", 2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: drawerlist(Icons.add_business_outlined, "Pending Sale Order", 3),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: drawerlist(Icons.account_balance_wallet_outlined, "Item Query", 4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget drawerlist(IconData icon, String text, int index) {

    bool isSelected =  currentIndex == index;
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
        ZoomDrawer.of(context)!.close();
        //ZoomDrawer.of(context)!.open();

      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, bottom: 30),

        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                      fontSize: 35,
                      color:  isSelected ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5)),
            )
          ],
        ),
      ),
    );
  }
}
