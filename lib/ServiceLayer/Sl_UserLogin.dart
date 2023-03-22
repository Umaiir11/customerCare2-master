import 'dart:convert';


import 'package:customercare/ClassModules/cmCryptography.dart';
import 'package:customercare/ClassModules/cmHttpCalls.dart';


import '../MVVM/Model/ApiModels/ModUserProfile.dart';
import '../MVVM/Model/MmoLogin.dart';
import '../MVVM/Model/ParameterModels/ParModUserLogin.dart';

class SlwUserLogin {


  Future<ModUserProfile?> Fnc_UserProfile(MmoLoginModel lMmoLoginModel) async {
    String lPrCompanyDID = "00000000-0000-0000-0000-000000000000";
    try {
      ParModUserProfile lParModUserProfile = ParModUserProfile(
          Pr_EmailID: lMmoLoginModel.username,
          Pr_Password: cmCryptography().Fnc_Encrypt_AES(lMmoLoginModel.password),
          Pr_CompanyDID: lPrCompanyDID);

      //Uri.https('www.aisonesystems.com', '/apiUser/UserProfile/Post');
      String lJsonString = json.encode((lParModUserProfile.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls()
          .Fnc_HttpResponseWeb('/apiUser/UserProfile/Post', lUtfContent);
      print(lResponse);
      if (lResponse.statusCode == 200) {
        return Fnc_JsonToModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModUserProfile Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModUserProfile lModUserProfile = ModUserProfile();

    lModUserProfile.Pr_PKGUID = lJsonObject["Pr_PKGUID"];
    lModUserProfile.Pr_EmailID = lJsonObject["Pr_EmailID"];
    lModUserProfile.Pr_FullName = lJsonObject["Pr_FullName"];
    lModUserProfile.Pr_ContactNo = lJsonObject["Pr_ContactNo"];
    lModUserProfile.Pr_Image = lJsonObject["Pr_Image"];

    return lModUserProfile;
  }

  //Method return list type
  List<ModUserProfile> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModUserProfile> lListModUserProfile =
        List<ModUserProfile>.empty(growable: true);

    for (dynamic lJsonObject in lJsonList) {
      ModUserProfile lModUserProfile = ModUserProfile();
      lModUserProfile = Fnc_JsonToModel(lJsonObject);
      lListModUserProfile.add(lModUserProfile);
    }
    return lListModUserProfile;
  }
}
