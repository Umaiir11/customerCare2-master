import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModCompanyURLs.dart';
import 'package:customercare/ServiceLayer/Sl_AssignedBranches.dart';
import 'package:customercare/ServiceLayer/Sl_CompanyURLs.dart';
import 'package:get/get.dart';

import '../Model/ApiModels/ModCompanySettingQuery.dart';
import 'VmLogin.dart';

class VmCompany extends GetxController {
  final VmLogin G_VmLogin = Get.find();
  RxList<ModCompanySettingQuery>? l_PrCompanyList =
      <ModCompanySettingQuery>[].obs;

  RxList<ModAssignedBranches>? l_PrAssignedBranchesList =
      <ModAssignedBranches>[].obs;

  void Fnc_addItem() {
    if (l_PrCompanyList?.isEmpty ?? true) {
      l_PrCompanyList?.addAll(G_VmLogin.l_PrCompanyList!);
    }
  }

  late RxString l_PrSearch = ''.obs;

  RxString get Pr_txtsearch_Text {
    return l_PrSearch;
  }

  set Pr_txtsearch_Text(RxString value) {
    l_PrSearch = value;
  }

  late RxInt l_PrselectedIndex = 0.obs;

  RxInt get Pr_txtselectedIndex_Text {
    return l_PrselectedIndex;
  }

  set Pr_txtselectedIndex_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  bool l_PrisFolded = false;

  bool get Pr_boolisFolded_wid {
    return l_PrisFolded;
  }

  set Pr_boolisFolded_wid(bool value) {
    l_PrisFolded = value;
  }
  RxBool Pr_isLoading = false.obs;

  RxBool get Pr_isLoading_wid {
    return Pr_isLoading;
  }
  set Pr_isLoading_wid(RxBool value) {
    Pr_isLoading = value;
  }

  int l_Prcount = 1;

  Future<bool> Fnc_OnlineToken() async {
    String email = l_PrCompanyList![Pr_txtselectedIndex_Text.value].Pr_EmailId;
    String uuid =
        l_PrCompanyList![Pr_txtselectedIndex_Text.value].Pr_CompanyDid;
    String Pass = Get.find(tag: "Pass");
    //APi Call CompanyUrls
    ModCompanyURLs? lModCompanyURLs =
        await Sl_CompanyURLs().Fnc_CompanyURls(email, Pass, uuid);
    //dynamic token = l_ModCompanyURLs?.Pr_Token;

    String? lToken = lModCompanyURLs?.Pr_Token;
    if (lToken == null) {
      return false;
    }

    cmGlobalVariables.Pb_ERPApiUrl = lModCompanyURLs?.Pr_ApiErpUrl;
    cmGlobalVariables.Pb_Token = lToken;
    return true;
  }

  Future<bool> Fnc_OnlineAssignedBranches() async {
    List<ModAssignedBranches>? lListAssignedBranches =
        List<ModAssignedBranches>.empty(growable: true);
    //Assigned Branches Api Call
    lListAssignedBranches = await Sl_AssignedBranches().Fnc_AssignedBranches();
    l_PrAssignedBranchesList?.addAll(lListAssignedBranches!);
    {
      if (l_PrAssignedBranchesList == null) {
        return false;
      }
      l_Prcount = l_PrAssignedBranchesList!.length;
    }

    return true;
  }






  Future<bool> Fnc_OnTapLoginBtn() async {
    Pr_isLoading_wid.value = true;

    try {

      if (await Fnc_OnlineToken() == true) {
        bool result = await Fnc_OnlineAssignedBranches().timeout(
            const Duration(seconds: 5));
        Pr_isLoading_wid.value = false;
        if (result) {
          return true; // API call was successful
        } else {
          // Handle error
          return false; // API call failed
        }
      }
    } catch (e) {
      // Handle timeout error
      Pr_isLoading_wid.value = false;
      print('API call timed out after 15 seconds');
      cmGlobalVariables.Pb_Exception = e.toString();
       // API call failed
    }
    return false;
  }



}
