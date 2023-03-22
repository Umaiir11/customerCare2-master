import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Searching/SrAccLedgerList.dart';
import '../../Searching/SrCompanyList.dart';
import '../Model/ApiModels/ModAccLedger.dart';

class VwAccountLedger extends StatefulWidget {
  const VwAccountLedger({Key? key}) : super(key: key);

  @override
  State<VwAccountLedger> createState() => _VwAccountLedgerState();
}

class _VwAccountLedgerState extends State<VwAccountLedger> {
  final l_SearchController = Get.put(SrAccLedgerList());

  //Controller
  TextEditingController _textController = TextEditingController();
  final G_currencyFormat = new NumberFormat("#,##0", "en_US");
  final DateFormat G_DateTimeFormat = DateFormat('dd-MMM-yy');

  DateTimeRange l_DateRange = DateTimeRange(
      start: DateTime.parse("2021-01-01"), end: DateTime.parse("2021-03-31"));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    l_SearchController.Fnc_addItem();
    //Orignal list copy for searching
    l_SearchController.Pr_filteredList.value
        .addAll(l_SearchController.l_PrAccLedgerList!);
    l_SearchController.searchText.listen((value) {
      l_SearchController.Fnc_filterlist(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final start = l_DateRange.start;
    final end = l_DateRange.end;

    Widget _WidgetportraitMode(double Pr_height, Pr_width) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.picture_as_pdf_sharp), onPressed: () async {}),
          ],

          centerTitle: true,
          toolbarHeight: 42,

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFD1FFFF),
                  Color(0xFFD1FFFF),
                  Color(0xFF88ECF8),
                ],
              ),
            ),
          ),
          title: Shimmer.fromColors(
              baseColor: Colors.black38,
              highlightColor: Colors.cyanAccent,
              child: Text("ACCLedger")),

          // backgroundColor: Colors.transparent,
          elevation: 7.0,
        ),
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
                stops: [0.0, 0.5, 0.7, 0.9],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Pr_height * .095, right: Pr_width * .040),
                  width: Pr_height * .370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.lightBlueAccent.shade100,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 16),
                              child: TextField(
                                onChanged: (value) =>
                                    l_SearchController.searchText.value = value,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(MdiIcons.searchWeb,
                                      size: 20, color: Colors.indigo),
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ))),
                    ],
                  ),
                ),
                Expanded(
                    child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: l_SearchController.Pr_filteredList.length,
                    itemBuilder: ((context, index) {
                      if (l_SearchController.Pr_filteredList.isEmpty) {
                        return SizedBox(); // Return an empty container if the filtered list is empty
                      }
                      return Column(
                        children: [
                          InkWell(
                            onTap: () async {},
                            child: SizedBox(
                              width: Pr_width*0.900,
                              height: Pr_height*0.150,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: (l_SearchController
                                            .Pr_filteredList[index + 1]
                                            .Pr_Credit ==
                                        0)
                                    ? Colors.white
                                    : Colors.grey.shade300,
                                child: Row(
                                  children: [


                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(

                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 25),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.5,
                                                  ),
                                                  children: [
                                                    l_SearchController
                                                        .getMatchedTextSpan(
                                                      l_SearchController
                                                          .Pr_filteredList[
                                                              index + 1]
                                                          .Pr_VNO,
                                                      l_SearchController
                                                          .searchText.value,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 180),

                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 25),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '',
                                                  style:  TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color:
                                                      Colors.black,
                                                      letterSpacing: .5),
                                                  children: [
                                                    l_SearchController
                                                        .getMatchedTextSpan(
                                                      G_DateTimeFormat.format( l_SearchController
                                                          .Pr_filteredList[
                                                      index + 1]
                                                          .Pr_VDate),

                                                      l_SearchController
                                                          .searchText.value,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),


                                        Row(
                                          children: [

                                            //Debit
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 25),
                                                  child: Text(
                                                    'Debit',
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black26,
                                                            letterSpacing: .5)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2, left: 27),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '',
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              letterSpacing:
                                                                  .5)),
                                                      children: [
                                                        l_SearchController
                                                            .getMatchedTextSpan(
                                                          G_currencyFormat.format(
                                                              l_SearchController
                                                                  .Pr_filteredList[
                                                                      index + 1]
                                                                  .Pr_Debit),
                                                          l_SearchController
                                                              .searchText.value,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //Credit
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 70),
                                                  child: Text(
                                                    'Credit',
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black26,
                                                            letterSpacing: .5)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2, left:72),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '',
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              letterSpacing:
                                                                  .5)),
                                                      children: [
                                                        l_SearchController
                                                            .getMatchedTextSpan(
                                                          G_currencyFormat.format(
                                                              l_SearchController
                                                                  .Pr_filteredList[
                                                                      index + 1]
                                                                  .Pr_Credit),
                                                          l_SearchController
                                                              .searchText.value,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //Balance
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 55),
                                                  child: Text(
                                                    'Balance',
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
                                                      top: 2, left: 57),
                                                  child:  RichText(
                                                    text: TextSpan(
                                                      text: '',
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              letterSpacing: .5)),
                                                      children: [
                                                        l_SearchController
                                                            .getMatchedTextSpan(
                                                          G_currencyFormat.format(
                                                              l_SearchController
                                                                  .Pr_filteredList[
                                                              index + 1]
                                                                  .Pr_Balance),
                                                          l_SearchController
                                                              .searchText.value,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                )),
              ],
            )),
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

//============================DART=================================
}
