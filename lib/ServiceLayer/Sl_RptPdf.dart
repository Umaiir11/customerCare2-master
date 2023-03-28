import 'dart:convert';
import 'package:get/get.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../ClassModules/cmGlobalVariables.dart';
import '../MVVM/Model/ApiModels/ModRptAccLedger.dart';
import 'Sl_OnlineEncryption.dart';

String? l_Encryption;

var d1 = "2022-01-13T13:49:44";
var d2 = "2022-08-13T13:49:44";
class SlERptPdf {
  Future<String?> Fnc_reportpdf() async {
    try {
      final body = ModRptAccLedger(
        Pr_FormDID: 6503,
        Pr_ReportName: "RptSerDevAccountLedger",
        Pr_BranchID: 1,
        Pr_Token:cmGlobalVariables.Pb_Token!,
        //Pr_AccountDID: cmGlobalVariables.Pb_ListUserAccountsQuery[0].Pr_AccountsDID ,
        Pr_AccountDID: "a01cc68a-28fe-411e-9fba-798d375b68fc" ,
        Pr_FromDate:DateTime.parse(d1),
        Pr_ToDate:DateTime.parse(d2),
        Pr_WhereClause_PC:
        "and [AccountDID]:'a01cc68a-28fe-411e-9fba-798d375b68fc'and[ChequeStatusDID]in(1,2)and[PostedID]:1",
        Pr_GroupByClause_PC: "",
        Pr_OrderByClause_PC: "Order By ChequeType , [ChequeDate] desc",
        Pr_City: "Lahore",
        Pr_Address: "Pakistan",
        Pr_PrintedBy: "CustCare",
      );

      String lJsonString = json.encode(body.toJson());
      cmGlobalVariables.Pb_jsonString = lJsonString;

      if (await Fnc_OnlineEncryption() == true) {
        String encoded = Uri.encodeComponent(l_Encryption!);
        // print(encoded);
        List<int> lUtfContent = utf8.encode(lJsonString);
        final lResponse = await cmHttpCalls().Fnc_HttpResponseforReport(
            '/RptSerAccountLedger/pdf?l_QueryString=', lUtfContent, encoded);
        if (lResponse.statusCode == 200) {
          print("AccLedgerReport");
          //return json.decode(json.encode(l_response.body));
          return json.decode(lResponse.body);

        } else {}
      } else {
        Get.snackbar("Alert", "No DATA, Please Contact Your Administrator");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

Future<bool> Fnc_OnlineEncryption() async {
  //Assigned Branches Api Call
  l_Encryption = await SlEncryption().Fnc_ItemQuery();
  {
    if (l_Encryption == null) {
      Get.snackbar("Alert", "No DATA, Please Contact Your Administrator");
      return false;
    }
  }

  return true;
}
