import 'dart:convert';

import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/ViewModel/VmDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'VwDrawer.dart';

class VwDrawerHome extends StatefulWidget {
  const VwDrawerHome({Key? key}) : super(key: key);

  @override
  State<VwDrawerHome> createState() => _VwDrawerHomeState();
}

class _VwDrawerHomeState extends State<VwDrawerHome> {
  @override
  final l_VmDrawer = Get.put(VmDrawer());

  @override
  void initState() {
    super.initState();

    l_VmDrawer.Fnc_addItem();
    l_VmDrawer.Pr_DecodeData_Image =
        base64.decode(cmGlobalVariables.Pb_UserImage);
    l_VmDrawer.Fnc_UserAccountQueryList();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        bottomNavigationBar: ResponsiveWrapper(
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          child: SizedBox(
            height: 33,
            child: BottomAppBar(
              elevation: 10.0,
              color: Colors.cyan.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      MdiIcons.whatsapp,
                      size: 20,
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
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse('https://www.aisonesystems.com/')),
                    child: Text(
                      'Powered by - aisonesystems.com',
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              letterSpacing: .5)),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.phone_forwarded_outlined,
                      size: 20,
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
                ],
              ),
            ),
          ),
        ),
        drawer: const SizedBox(
          width: 270,
        ),
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
                  margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
                  height: 220,
                  width: 480,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
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
                        margin: const EdgeInsets.only(top: 55, left: 180),
                        child: const Text("kk"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 42, left: 12),
                  child: const InkWell(
                    child: DrawerWidget(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 110, left: 112),
                  child: const Text(
                    "80",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 103, left: 73),
                  child: SizedBox(
                    height: 40,
                    child: Image.asset("assets/inc.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 129, left: 80),
                  child: const Text(
                    "Balance",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 110, left: 212),
                  child: const Text(
                    "30",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 103, left: 173),
                  child: SizedBox(
                    height: 35,
                    child: Image.asset("assets/dec.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 129, left: 180),
                  child: const Text(
                    "Payment",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 110, left: 312),
                  child: const Text(
                    "7",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 103, left: 273),
                  child: SizedBox(
                    height: 40,
                    child: Image.asset("assets/inc.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 129, left: 290),
                  child: const Text(
                    "Over Due Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 180, left: 20),
                  width: 215,
                  height: 75,
                  decoration: const BoxDecoration(
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
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 100),
                        child: const Text("bb"),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 45, left: 100),
                          child: const Text(
                            "RS: 45415",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 23),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 7),
                        child: SizedBox(
                          height: 35,
                          child: Image.asset("assets/cashr.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 180, left: 250),
                  width: 215,
                  height: 75,
                  decoration: const BoxDecoration(
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
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 100),
                        child: const Text("cc"),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 45, left: 100),
                          child: const Text(
                            "RS: 45415",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 23),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 7),
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

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
