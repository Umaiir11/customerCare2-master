import 'dart:convert';
import 'dart:typed_data';
import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:get/get.dart';
import '../../ServiceLayer/Sl_RptPdf.dart';

class VmReport extends GetxController {


  FncReport() async {
    String? lResult;

    lResult = await SlERptPdf().Fnc_reportpdf();
    print(lResult);

    if (lResult == null) {
      Get.snackbar("Alert", "Invalid Login Information");
    } else {



      Uint8List decoded = base64.decode(lResult);


      cmGlobalVariables.Pb_Report = decoded;


      print(cmGlobalVariables.Pb_Report);
    }
  }



}
