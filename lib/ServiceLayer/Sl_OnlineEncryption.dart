import 'dart:convert';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../ClassModules/cmHttpCalls.dart';


class SlEncryption {
  Future<String?> Fnc_ItemQuery() async {
    try {
      String lJsonString = json.encode((cmGlobalVariables.Pb_jsonString));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse =
      await cmHttpCalls().Fnc_HttpCallForEncryption(lUtfContent);

      if (lResponse.statusCode == 200) {
        String lResult = json.decode( json.encode(lResponse.body));
        //return json.decode(l_response.body);
        print(lResult);
        return lResponse.body;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
