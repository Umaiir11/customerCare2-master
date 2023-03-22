import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../Searching/SrCompanyList.dart';
import '../ViewModel/VmCompany.dart';
import 'VwAssignedBranches.dart';

class VwCompany extends StatefulWidget {
  const VwCompany({Key? key}) : super(key: key);

  @override
  State<VwCompany> createState() => _VwCompanyState();
}

class _VwCompanyState extends State<VwCompany> {
  @override
  final VmCompany l_VmCompany = Get.put(VmCompany());
  final l_SearchController = Get.put(SrCompanyList());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l_VmCompany.Fnc_addItem();
    l_SearchController.Fnc_addItem();
    //Orignal list copy for searching
    l_SearchController.Pr_filteredList.value.addAll(l_SearchController.l_PrCompanyList!);
    l_SearchController.searchText.listen((value) {
      l_SearchController.Fnc_filterlist(value);
    });
  }

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
                      Uri whatsappopen = Uri.parse("whatsapp://send?phone=$whatsapp");
                      if (await launchUrl(whatsappopen)) {
                        //dialer opened
                      } else {
                        //dailer is not opened
                      }
                    },
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse('https://www.aisonesystems.com/')),
                    child: Text(
                      'Powered by - aisonesystems.com',
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(fontSize: 14, color: Colors.black54, letterSpacing: .5)),
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
        body: Container(
          height: PrHeight,
          width: PrWidth,
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
                  top: PrHeight * .080,
                ),
                child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.cyanAccent,
                    child: const Text("lblCompanyList")),
              ),
              Container(
                margin: EdgeInsets.only(top: PrHeight * .095, right: PrWidth * .040),
                width: PrHeight * .370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.lightBlueAccent.shade100,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: TextField(
                              onChanged: (value) => l_SearchController.searchText.value = value,
                              decoration: const InputDecoration(
                                suffixIcon:
                                    Icon(MdiIcons.searchWeb, size: 20, color: Colors.indigo),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ))),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => Stack(
                      children: [
                        ListView.builder(
                          itemCount: l_SearchController.Pr_filteredList.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (await l_VmCompany.Fnc_OnTapLoginBtn() == true) {
                                      Get.to(() => const VwAssignedBranches());
                                    } else {
                                      Get.snackbar("Exception", cmGlobalVariables.Pb_Exception!);
                                    }

                                    setState(() {
                                      l_VmCompany.Pr_txtselectedIndex_Text.value = index;
                                    });
                                  },
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
                                    child: SizedBox(
                                      width: 450,
                                      height: 180,
                                      child: Card(
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                        color: index % 2 == 0
                                            ? Colors.lightBlueAccent.shade100
                                            : Colors.lightBlue.shade100,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15, left: 25),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '',
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        letterSpacing: 0.5,
                                                      ),
                                                      children: [
                                                        l_SearchController.getMatchedTextSpan(
                                                          l_SearchController
                                                              .Pr_filteredList[index].Pr_CompanyName,
                                                          l_SearchController.searchText.value,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 10, left: 25),
                                                          child: Text(
                                                            'Email',
                                                            style: GoogleFonts.ubuntu(
                                                                textStyle: const TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.black26,
                                                                    letterSpacing: .5)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 2, left: 25),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              text: '',
                                                              style: GoogleFonts.ubuntu(
                                                                  textStyle: const TextStyle(
                                                                      fontSize: 13,
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: .5)),
                                                              children: [
                                                                l_SearchController.getMatchedTextSpan(
                                                                  l_SearchController
                                                                      .Pr_filteredList[index].Pr_EmailId,
                                                                  l_SearchController.searchText.value,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 10, left: 25),
                                                          child: Text(
                                                            'Phone',
                                                            style: GoogleFonts.ubuntu(
                                                                textStyle: const TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors.black26,
                                                                    letterSpacing: .5)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 2, left: 25),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              text: '',
                                                              style: GoogleFonts.ubuntu(
                                                                  textStyle: const TextStyle(
                                                                      fontSize: 13,
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: .5)),
                                                              children: [
                                                                l_SearchController.getMatchedTextSpan(
                                                                  l_SearchController
                                                                      .Pr_filteredList[index]
                                                                      .Pr_CompanyPhone,
                                                                  l_SearchController.searchText.value,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10, left: 25),
                                                  child: Text(
                                                    'Address',
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black26,
                                                            //fontWeight: FontWeight.w600,
                                                            letterSpacing: .5)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 2, left: 25),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '',
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: const TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600,
                                                              letterSpacing: .5)),
                                                      children: [
                                                        l_SearchController.getMatchedTextSpan(
                                                          l_SearchController
                                                              .Pr_filteredList[index].Pr_CompanyAddress,
                                                          l_SearchController.searchText.value,
                                                        ),
                                                      ],
                                                    ),
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
                        ),
                        if (l_VmCompany.Pr_isLoading_wid.value)
                          Visibility(
                            visible: l_VmCompany.Pr_isLoading_wid.value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                backgroundBlendMode: BlendMode.darken,
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Center(
                                    child: LoadingAnimationWidget.flickr(
                                  leftDotColor: const Color(0xFF1A1A3F),
                                  rightDotColor: const Color(0xFFEA3799),
                                  size: 40,
                                )),
                              ),
                            ),
                          )
                      ],
                    )),
              ),
            ],
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
