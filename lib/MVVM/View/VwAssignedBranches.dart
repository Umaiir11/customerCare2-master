import 'package:customercare/MVVM/View/Drawer/VwDrawerHome.dart';
import 'package:customercare/MVVM/View/testui.dart';
import 'package:customercare/MVVM/ViewModel/VmAssignedBranches.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Drawer.dart';
import 'Drawer/VwDrawer.dart';

class VwAssignedBranches extends StatefulWidget {
  const VwAssignedBranches({Key? key}) : super(key: key);

  @override
  State<VwAssignedBranches> createState() => _VwAssignedBranchesState();
}

class _VwAssignedBranchesState extends State<VwAssignedBranches> {
  @override
  final l_VmAssignedBranches = Get.put(VmAssignedBranches());

  void initState() {
    // TODO: implement initState
    super.initState();
    l_VmAssignedBranches.Fnc_addItem();
  }
  //UserWidgets

  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double Pr_height, Pr_width) {
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
                    icon: Icon(
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
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              letterSpacing: .5)),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
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
        body: Container(
          height: Pr_height,
          width: Pr_width,
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
              stops: [0.0, 0.5, 0.7, 0.9],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Pr_height*.080,
                ),
                child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.cyanAccent,
                    child: Text("lblCompanyList")),
              ),
              SizedBox(height: Pr_height*0.020,),
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: l_VmAssignedBranches.l_PrAssignedBranchesList?.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap:(){

                            Get.to(() => vi_Drawer());

                          } ,

                          child: ResponsiveWrapper(
                            maxWidth: 1200,
                            minWidth: 480,
                            defaultScale: true,
                            breakpoints: const [
                              ResponsiveBreakpoint.resize(480,
                                  name: MOBILE),
                              ResponsiveBreakpoint.autoScale(800,
                                  name: TABLET),
                              ResponsiveBreakpoint.resize(1000,
                                  name: DESKTOP),
                              ResponsiveBreakpoint.autoScale(2460,
                                  name: '4K'),
                            ],
                            child: SizedBox(
                              width: 450,
                              height: 180,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                color: index % 2 == 0
                                    ? Colors.lightBlueAccent.shade100
                                    : Colors.lightBlue.shade100,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 25),
                                          child: Text(
                                            l_VmAssignedBranches.l_PrAssignedBranchesList
                                                ![index].pr_BranchName,
                                            //G_CompanyList[index].Pr_CompanyName,
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    letterSpacing: .5)),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 25),
                                                  child: Text(
                                                    'Address',
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .black26,
                                                            letterSpacing:
                                                            .5)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2, left: 25),
                                                  child: Text(
                                                    l_VmAssignedBranches.l_PrAssignedBranchesList
                                                        ![
                                                    index]
                                                    .pr_Address,
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            letterSpacing:
                                                            .5)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 25),
                                                  child: Text(
                                                    'BranchDID',
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .black26,
                                                            letterSpacing:
                                                            .5)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2, left: 25),
                                                  child: Text(
                                                    l_VmAssignedBranches.l_PrAssignedBranchesList![
                                                    index]
                                                        .pr_BranchDID
                                                        .toString(),
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            letterSpacing:
                                                            .5)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 25),
                                          child: Text(
                                            'User DID',
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black26,
                                                    //fontWeight: FontWeight.w600,
                                                    letterSpacing: .5)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 2, left: 25),
                                          child: Text(
                                            l_VmAssignedBranches.l_PrAssignedBranchesList![index]
                                                .pr_UserDID
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    letterSpacing: .5)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                )),
              ),
            ],

          )
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

//=================DART==================

}
