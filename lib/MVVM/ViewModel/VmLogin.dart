import 'package:get/get.dart';
import '../../ClassModules/cmGlobalVariables.dart';
import '../../ServiceLayer/Sl_UserLogin.dart';
import '../../ServiceLayer/Sl_WLogin.dart';
import '../Model/ApiModels/ModCompanySettingQuery.dart';
import '../Model/ApiModels/ModUserProfile.dart';
import '../Model/MmoLogin.dart';

class VmLogin extends GetxController {
  MmoLoginModel l_MmoLoginModel = MmoLoginModel();

  RxList<ModCompanySettingQuery>? l_PrCompanyList =
      <ModCompanySettingQuery>[].obs;

  RxString l_PrUsername = ''.obs;

  String get Pr_txtusername_Text {
    return l_PrUsername.value = "aisonesystems@gmail.com";
  }

  set Pr_txtusername_Text(String value) {
    l_PrUsername.value = value;
  }

  RxString l_PrPassword = ''.obs;

  String get Pr_txtpassword_Text {
    return l_PrPassword.value ="GodHelp145";
  }

  set Pr_txtpassword_Text(String value) {
    l_PrPassword.value = value;
  }

  RxBool l_PrisSecurePassword = false.obs;

  RxBool get Pr_boolSecurePassword_wid {
    return l_PrisSecurePassword;
  }

  set Pr_boolSecurePassword_wid(RxBool value) {
    l_PrisSecurePassword = value;
  }

  RxBool Pr_isLoading = false.obs;

  RxBool get Pr_isLoading_wid {
    return Pr_isLoading;
  }

  set Pr_isLoading_wid(RxBool value) {
    Pr_isLoading = value;
  }

  Fnc_SetModelFields() {
    l_MmoLoginModel.username = l_PrUsername.value.trim();
    l_MmoLoginModel.password = l_PrPassword.value;
    //l_MmoLoginModel.companyList = l_PrCompanyList.;
  }

  bool get isValid {
    return l_PrUsername == null && l_PrPassword == null;
  }

  Future<bool> Fnc_ValidateLogin() async {
    Fnc_SetModelFields();
    if (l_PrUsername == null) {
      print("Email req");
      return false;
    } else if (l_PrPassword == null) {
      print("Pass req");
      return false;
    } else {
      if (await Fnc_WValidateUser() == true) {
        if (await Fnc_OnlineProcedures() == true) {
          // Pr_bool_isLoading_wid = true;
          print("Done");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }

  Future<bool> Fnc_WValidateUser() async {
    ModUserProfile? lModUserProfile =
        await SlwUserLogin().Fnc_UserProfile(l_MmoLoginModel);
    if (lModUserProfile == null) {
      return false;
    }

    cmGlobalVariables.Pb_UserDID = lModUserProfile.Pr_PKGUID;
    cmGlobalVariables.Pb_UserName = lModUserProfile.Pr_FullName;
    cmGlobalVariables.Pb_UserEmail = lModUserProfile.Pr_EmailID;
    cmGlobalVariables.Pb_UserNumber = lModUserProfile.Pr_ContactNo;
    cmGlobalVariables.Pb_UserImage = lModUserProfile.Pr_Image;
    return true;
  }

  Future<bool> Fnc_OnlineProcedures() async {
    Fnc_SetModelFields();
    List<ModCompanySettingQuery>? lListcompany =
        List<ModCompanySettingQuery>.empty(growable: true);

    lListcompany = await SlwLogin().Fnc_WLogin(l_MmoLoginModel);
    l_PrCompanyList?.addAll(lListcompany!);

    if (l_PrCompanyList == null) {
      return false;
    }
    return true;
  }

  Future<bool> Fnc_OnTapLoginBtn() async {
    Pr_isLoading_wid.value = true;
    try {
      // Set a timeout of 5 seconds for the API call
      bool result = await Fnc_ValidateLogin().timeout(const Duration(seconds: 10));
      Pr_isLoading_wid.value = false;
      if (result) {
        return true; // API call was successful
      } else {
        // Handle error
        return false; // API call failed
      }
    } catch (e) {
      // Handle timeout error
      Pr_isLoading_wid.value = false;
      print('API call timed out after 15 seconds');
      cmGlobalVariables.Pb_Exception = e.toString();
      return false; // API call failed
    }
  }
}
