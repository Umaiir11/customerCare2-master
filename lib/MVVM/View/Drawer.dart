import 'dart:convert';
import 'dart:typed_data';


import 'package:customercare/MVVM/View/testui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ViewModel/VmDrawer.dart';



class vi_Drawer extends StatefulWidget {
  const vi_Drawer({Key? key}) : super(key: key);

  @override
  State<vi_Drawer> createState() => _vi_DrawerState();
}

class _vi_DrawerState extends State<vi_Drawer> {
  @override
  final l_VmDrawer = Get.put(VmDrawer());



  GlobalKey<ScaffoldState> scafKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 33,
        child: BottomAppBar(
            elevation: 10.0,
            color: Colors.cyan.shade200,
            child: ResponsiveWrapper(
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
              child: Stack(
                children: [
                  Container(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.5, left: 84),
                    child: InkWell(
                      onTap: () => launchUrl(
                          Uri.parse('https://www.aisonesystems.com/')),
                      child: Text(
                        'Powered by - aisonesystems.com',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                letterSpacing: .5)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 385),
                    child: IconButton(
                      icon: Icon(
                        Icons.phone_forwarded_outlined,
                        size: 25,
                        color: Colors.indigoAccent,
                      ),
                      onPressed: () async {
                        Uri phoneno = Uri.parse('tel:+923214457734');
                        if (await launchUrl(phoneno)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 22),
                    child: IconButton(
                      icon: Icon(
                        MdiIcons.whatsapp,

                        size: 25,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        var whatsapp = "+923214457734";
                        Uri whatsappopen =
                            Uri.parse("whatsapp://send?phone=$whatsapp");
                        if (await launchUrl(whatsappopen)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
      drawer: SizedBox(
        width: 270,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: ResponsiveWrapper(
                      maxWidth: 1200,
                      minWidth: 480,
                      defaultScale: true,
                      breakpoints: const [
                        ResponsiveBreakpoint.resize(480, name: MOBILE),
                        ResponsiveBreakpoint.autoScale(800, name: TABLET),
                        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                        ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                      ],
                      child: Stack(
                        children: <Widget>[


                        ],
                      ),
                    ),
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),


                  SizedBox(
                    height: 1,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  //tile2

                  ListTile(
                      //selected: selectedIndex == 1,
                      leading: Icon(
                        Icons.library_books_outlined,
                        size: 28,
                      ),
                      title: Text("AcccLedger"),
                      onTap: () async {
                        //changeIndex(0);
                        Get.snackbar("Please Wait", "Data Is Loading");

                        if (await l_VmDrawer.Fnc_AccLedgerList() == true) {
                          Get.to(() => vi_AccountLedger());
                        } else {
                          Get.snackbar("Alert",
                              "No DATA, Please Contact Your Administrator");
                        }
                      }),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 280),
                    child: ListTile(
                        //selected: selectedIndex == 1,
                        leading: Icon(
                          Icons.logout,
                          size: 28,
                        ),
                        title: Text("last"),
                        onTap: () async {

                        }),
                  ),

                  //tile2
                ],
              ),
            ],
          ),
        ),
      ),
      key: scafKey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFD1FFFF),
              Color(0xFF88ECF8),
              Color(0xFF65DCDC),
            ],
            stops: [0.1, 0.5, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: ResponsiveWrapper(
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            child: Stack(children: <Widget>[
              Container(
                height: 500,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                height: 220,
                width: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent.shade200,
                    Colors.lightBlueAccent.shade200,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 180),
                      child: Text("last"),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 42, left: 12),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      scafKey.currentState?.openDrawer();
                    },
                  )),
              Container(
                margin: EdgeInsets.only(top: 110, left: 112),
                child: Text(
                  "80",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 73),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 80),
                child: Text(
                  "Balance",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 212),
                child: Text(
                  "30",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 173),
                child: SizedBox(
                  height: 35,
                  child: Image.asset("assets/dec.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 180),
                child: Text(
                  "Payment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110, left: 312),
                child: Text(
                  "7",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 103, left: 273),
                child: SizedBox(
                  height: 40,
                  child: Image.asset("assets/inc.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 129, left: 290),
                child: Text(
                  "Over Due Amount",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 20),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: Text("last"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashr.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 180, left: 250),
                width: 215,
                height: 75,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 5),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: Text("last"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 45, left: 100),
                        child: Text(
                          "RS: 45415",
                          style: TextStyle(color: Colors.black38, fontSize: 23),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 7),
                      child: SizedBox(
                        height: 35,
                        child: Image.asset("assets/cashp.png"),
                      ),
                    ),
                  ],
                ),
              ),

              //Grid

              //Grid
            ]),
          ),
        ),
      ),
    );
  }

  //=================DART==================


}
