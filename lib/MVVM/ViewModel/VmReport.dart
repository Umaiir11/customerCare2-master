import 'dart:convert';
import 'dart:typed_data';
import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:get/get.dart';
import '../../ServiceLayer/Sl_RptPdf.dart';

class VmReport extends GetxController {


  FncReport() async {
    String? l_result;

    l_result = await SlERptPdf().Fnc_reportpdf();
    print(l_result);

    if (l_result == null) {
      Get.snackbar("Alert", "Invalid Login Information");
    } else {



      Uint8List decoded = base64.decode(l_result);


      cmGlobalVariables.Pb_Report = decoded;


      print(cmGlobalVariables.Pb_Report);
    }
  }



}
