import 'dart:convert';
import 'dart:typed_data';

import 'package:customercare/MVVM/View/VwLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../ViewModel/VmDrawer.dart';
import 'VwDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int currentIndex=0;
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: MenuScreen(setIndex: (index) {

        setState(() {
          currentIndex = index;
        });
      },),

      mainScreen: setScreenIndex(),
      showShadow: true,
      borderRadius: 30,
      menuBackgroundColor: Colors.lightBlue,


    );
  }


  Widget setScreenIndex(){
    switch(currentIndex){
      case 0:
        return vi_Drawer();case 1:
        return Container(
          color: Colors.lightBlue,
        );case 2:
        return Container(
          color: Colors.deepPurple,
        );case 3:
        return Container(
          color: Colors.red,
        );case 4:
        return Container(
          color: Colors.deepPurpleAccent,
        );case 5:
        return VwLogin();

      default:
        return vi_Drawer();

    }
  }
}




class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {

      ZoomDrawer.of(context)!.toggle();
    }, icon: Icon(Icons.menu));
  }
}


class MenuScreen extends StatefulWidget {
  final ValueSetter setIndex;

  const MenuScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}
class _MenuScreenState extends State<MenuScreen> {
  @override
  final l_VmDrawer = Get.put(VmDrawer());

  void initState() {
    super.initState();
    l_VmDrawer.Fnc_addItem();
    l_VmDrawer.Pr_DecodeData_Image =
        base64.decode(cmGlobalVariables.Pb_UserImage);
    l_VmDrawer.Fnc_UserAccountQueryList();
  }

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
              padding: EdgeInsets.only(top: deviceHeight * 0.120, left: devicewidth * 0.160),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.shade100.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 17,
                      offset: Offset(0, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: MemoryImage(
                      Uint8List.fromList(l_VmDrawer.Pr_DecodeData_Image!),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10, left: 48),
                      child: Text(
                        cmGlobalVariables.Pb_UserName!,
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
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
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Padding(
                  padding:
                  EdgeInsets.only(top: 8, left: 80),
                  child: Text(
                    l_VmDrawer
                        .l_PrAssignedBranchesList![
                    l_VmDrawer
                        .Pr_txtselectedIndex_Text
                        .value]
                        .pr_BranchName,
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10, left: 30),
                      child: Text(
                        cmGlobalVariables.Pb_UserEmail!,
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
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

                Padding(padding: EdgeInsets.only(top: 300),
                  child: drawerlist(Icons.home, "Home",0),
                ) ,

                Padding(padding: EdgeInsets.only(top: 8),
                child: drawerlist(Icons.home, "Account Ledger",1),
                ) ,
                Padding(padding: EdgeInsets.only(top: 8),
                child: drawerlist(Icons.home, "Pending Cheques",2),
                ),Padding(padding: EdgeInsets.only(top: 8),
                child: drawerlist(Icons.home, "Pending Sale Order",3),
                ),Padding(padding: EdgeInsets.only(top: 8),
                child: drawerlist(Icons.home, "Item Query",4),
                ),

                Padding(padding: EdgeInsets.only(top: 8),
                child: drawerlist(Icons.home, "Logout",5),
                ),
              ],
            )


          ],
        ),
      )
      ,
    );
  }
  Widget drawerlist(IconData icon,String text,int index){
    return GestureDetector(
      onTap: (){
        widget.setIndex(index);
        if(index ==5){
          print("555555");
        }
      },
      child: Container(

        margin: EdgeInsets.only(left: 30,bottom: 30),
        child: Row(
          children: [
            Icon(icon,size: 35,),
            SizedBox(width: 10,),
            Text(text,   style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5)), )
          ],
        ),
      ),
    );

  }
}

