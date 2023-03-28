
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../../ClassModules/cmGlobalVariables.dart';

class VwReport extends StatefulWidget {
  const VwReport({Key? key}) : super(key: key);

  @override
  State<VwReport> createState() => _VwReportState();
}

class _VwReportState extends State<VwReport> {
  @override
  String fileName = "Account Ledger";
  int count = 0;

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'Key1',
        channelName: 'file downloaded',
        channelDescription: ' done',
        defaultColor: Colors.cyanAccent,
        ledColor: Colors.white,
        playSound: true,
        soundSource: "",
        enableLights: true,
        enableVibration: true,
      )
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          count++;

        }, // icon to be displayed on the button
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save_alt), // background color of the button
      ),
      appBar: AppBar(

        centerTitle: true,
        toolbarHeight: 42,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
            baseColor: Colors.black38, highlightColor: Colors.cyanAccent, child: const Text("Report")),
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
        child: SfPdfViewer.memory(
          cmGlobalVariables.Pb_Report!,
          pageLayoutMode: PdfPageLayoutMode.continuous,
          scrollDirection: PdfScrollDirection.vertical,
          enableDoubleTapZooming: true,
        ),
      ),
    );
  }

  void FncSaveBytesAsPdf(String fileName) async {
    String lFilePath = '/storage/emulated/0/Download/$fileName($count).pdf';
    File lFile = File(lFilePath);
    lFile.writeAsBytes(cmGlobalVariables.Pb_Report);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Report Saved"),
      duration: Duration(milliseconds: 1200),
    ));
  }


  void notify() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'Key1',
          title: "${Emojis.activites_party_popper} File Saved",
          body: "PDF saved in 'Download' location",
          wakeUpScreen: true,
          notificationLayout: NotificationLayout.BigText,
        ));
  }





}
