import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class cmCryptography {
  static final l_key = encrypt.Key.fromUtf8("0dc27f7a882043aea0c1e3a05cf8fbfe");
  static final initialization_vector = encrypt.IV.fromLength(16);

  //Passing key to AES Crypto Algo
  static final G_encrypter =
  encrypt.Encrypter(encrypt.AES(l_key, mode: AESMode.cbc));

  //Methods

  String Fnc_Encrypt_AES(String l_PlainText) {
    Encrypted l_Encrypted = G_encrypter.encrypt(l_PlainText, iv: initialization_vector);
    String l_EncryptedText = l_Encrypted.base64.toString();
    Get.put(l_EncryptedText,tag:"Pass" );
    return l_EncryptedText;
  }

  String Fnc_decrypted_AES( String l_EncryptedText) {
    String l_DecryptedText = G_encrypter.decrypt(l_EncryptedText as Encrypted, iv: initialization_vector) ;
    return l_DecryptedText;
  }

}
