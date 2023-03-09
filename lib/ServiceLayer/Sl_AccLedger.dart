import 'dart:convert';

import 'package:customercare/MVVM/Model/ParameterModels/PrModAccLedger.dart';
import 'package:intl/intl.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/ApiModels/ModAccLedger.dart';

class Sl_AccountLedger {
  Future<List<ModAccountLedger>?> Fnc_AccountLedger(
    DateTime StartDate,
    DateTime EndDate,
  ) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String? l_StartDate = formatter.format(StartDate);
      final String? l_DateTime = formatter.format(EndDate);
      String? l_AccountsDID = cmGlobalVariables.Pb_AccountsDID;

      ParModAccLedger l_ParModAccLedger = ParModAccLedger(
          Pr_AccountDID: l_AccountsDID,
          Pr_FromDate: l_StartDate,
          Pr_ToDate: l_DateTime);

      // Uri l_uri = Uri.http(ipAddress, '/RptAssignedBranches/Fnc_Read_Sp');

      String l_jsonString = json.encode((l_ParModAccLedger.toJson()));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptAccountLedger/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        var a = l_response;
        print(a);
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModAccountLedger Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModAccountLedger l_ModI_AccountLedger = new ModAccountLedger();

    l_ModI_AccountLedger.Pr_PKGUID = l_JsonObject["Pr_PKGUID"] ?? '0';
    l_ModI_AccountLedger.Pr_SrNo = l_JsonObject["Pr_SrNo"] ?? 0;
    l_ModI_AccountLedger.Pr_VNO = l_JsonObject["Pr_VNO"] ?? '0';
    l_ModI_AccountLedger.Pr_VDate =
        DateTime.parse(l_JsonObject["Pr_VDate"] ?? "2022-08-13T13:49:44");
    l_ModI_AccountLedger.Pr_AccountDID = l_JsonObject["Pr_AccountDID"] ?? '0';
    l_ModI_AccountLedger.Pr_AccountID = l_JsonObject["Pr_AccountID"] ?? '0';
    l_ModI_AccountLedger.Pr_CurrencyCode =
        l_JsonObject["Pr_CurrencyCode"] ?? '0';
    l_ModI_AccountLedger.Pr_RefNo = l_JsonObject["Pr_RefNo"] ?? '0';
    l_ModI_AccountLedger.Pr_Remarks = l_JsonObject["Pr_Remarks"] ?? '0';
    l_ModI_AccountLedger.Pr_Narrations = l_JsonObject["Pr_Narrations"] ?? '0';
    l_ModI_AccountLedger.Pr_CrossAccountDID =
        l_JsonObject["Pr_CrossAccountDID"] ?? '0';
    l_ModI_AccountLedger.Pr_CrossAccountID =
        l_JsonObject["Pr_CrossAccountID"] ?? '0';
    l_ModI_AccountLedger.Pr_CrossCurrencyCode =
        l_JsonObject["Pr_CrossCurrencyCode"] ?? '0';
    lat:
    l_ModI_AccountLedger.Pr_Debit = l_JsonObject["Pr_Debit"] ?? 0;
    lat:
    l_ModI_AccountLedger.Pr_Credit = l_JsonObject["Pr_Credit"] ?? 0;
    lat:
    l_ModI_AccountLedger.Pr_ExRate = l_JsonObject["Pr_ExRate"] ?? 0;
    lat:
    l_ModI_AccountLedger.Pr_Balance = l_JsonObject["Pr_Balance"] ?? 0;

    l_ModI_AccountLedger.Pr_ST = l_JsonObject["Pr_ST"] ?? '0';
    l_ModI_AccountLedger.Pr_VMDID = l_JsonObject["Pr_VMDID"] ?? '0';
    l_ModI_AccountLedger.Pr_VDDID = l_JsonObject["Pr_VDDID"] ?? '0';

    l_ModI_AccountLedger.Pr_VType = l_JsonObject["Pr_VType"] ?? 0;

    l_ModI_AccountLedger.Pr_Voucher = l_JsonObject["Pr_Voucher"] ?? '0';
    l_ModI_AccountLedger.Pr_PostedID = l_JsonObject["Pr_PostedID"] ?? false;
    l_ModI_AccountLedger.Pr_TransID = l_JsonObject["Pr_TransID"] ?? 0;
    l_ModI_AccountLedger.Pr_BranchID = l_JsonObject["Pr_BranchID"] ?? 0;
    return l_ModI_AccountLedger;
  }

  List<ModAccountLedger> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModAccountLedger> l_ListModI_AccountLedger =
        new List<ModAccountLedger>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModAccountLedger l_ModI_AccountLedger = new ModAccountLedger();
      l_ModI_AccountLedger = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_AccountLedger.add(l_ModI_AccountLedger);
    }
    return l_ListModI_AccountLedger;
  }
}
