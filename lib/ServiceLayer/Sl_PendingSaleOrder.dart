import 'dart:convert';
import '../../ClassModules/cmHttpCalls.dart';
import '../ClassModules/cmGlobalVariables.dart';
import '../MVVM/Model/ApiModels/ModPendingSaleOrder.dart';
import '../MVVM/Model/ParameterModels/ParModPendingSaleOrder.dart';

class Sl_PendingSelOrder {
  Future<List<ModPendingSaleOrder>?> Fnc_PendingSO() async {
    try {
      String? Did ="30B8C293-198D-4560-8EA9-249E9CD146B3";
      //String? Did = cmGlobalVariables.Pb_AccountsDID;

      print(Did);
      print(Did);
      ParModPendingSaleOrder l_ParModPendingSaleOrder =
          new ParModPendingSaleOrder(Pr_Branchid: 1, Pr_AccountDID: Did);

      final body = {
        "Pr_Branchid": 1,
        // "Pr_AccountDID": "30B8C293-198D-4560-8EA9-249E9CD146B3"
        "Pr_AccountDID": Did!
      };

      String l_jsonString = json.encode((l_ParModPendingSaleOrder.toJson()));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls().Fnc_HttpResponseERPBoth(
          '/RptPendingSaleOrder/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        var a = l_response;
        print(a);
        print("Pending S/O)");
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModPendingSaleOrder Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModPendingSaleOrder l_ModI_PendingSaleOrder = new ModPendingSaleOrder();

    l_ModI_PendingSaleOrder.Pr_PKGUID = l_JsonObject["Pr_PKGUID"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_VNO = l_JsonObject["Pr_VNO"] ?? 0;
    l_ModI_PendingSaleOrder.Pr_VoucherNo = l_JsonObject["Pr_VoucherNo"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_VDate =
        DateTime.parse(l_JsonObject["Pr_VDate"] ?? "2022-08-13T13:49:44");
    l_ModI_PendingSaleOrder.Pr_AccountDID =
        l_JsonObject["Pr_AccountDID"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_AccountID = l_JsonObject["Pr_AccountID"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_CustomerRefNo =
        l_JsonObject["Pr_CustomerRefNo"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_RefNo = l_JsonObject["Pr_RefNo"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_Remarks = l_JsonObject["Pr_Remarks"] ?? '0';
    lat:
    l_ModI_PendingSaleOrder.Pr_FGrandTotal =
        l_JsonObject["Pr_FGrandTotal"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_CGrandTotal =
        l_JsonObject["Pr_CGrandTotal"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_FExportableAmount =
        l_JsonObject["Pr_FExportableAmount"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_CExportableAmount =
        l_JsonObject["Pr_CExportableAmount"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_FPendingAmount =
        l_JsonObject["Pr_FPendingAmount"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_CPendingAmount =
        l_JsonObject["Pr_CPendingAmount"] ?? 0;
    lat:
    l_ModI_PendingSaleOrder.Pr_PQty = l_JsonObject["Pr_PQty"] ?? 0;
    l_ModI_PendingSaleOrder.Pr_StageID = l_JsonObject["Pr_StageID"] ?? '0';
    l_ModI_PendingSaleOrder.Pr_BranchID = l_JsonObject["Pr_BranchID"] ?? 0;
    return l_ModI_PendingSaleOrder;
  }

  List<ModPendingSaleOrder> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModPendingSaleOrder> l_ListModI_PendingSaleOrder =
        new List<ModPendingSaleOrder>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModPendingSaleOrder l_ModI_PendingSaleOrder = new ModPendingSaleOrder();
      l_ModI_PendingSaleOrder = Fnc_JsonToModel(l_JsonObject);
      l_ListModI_PendingSaleOrder.add(l_ModI_PendingSaleOrder);
    }
    return l_ListModI_PendingSaleOrder;
  }
}
