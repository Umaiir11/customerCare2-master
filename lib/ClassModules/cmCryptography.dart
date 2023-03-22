import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';

class cmCryptography {
  static final l_key = encrypt.Key.fromUtf8("0dc27f7a882043aea0c1e3a05cf8fbfe");
  static final initialization_vector = encrypt.IV.fromLength(16);

  //Passing key to AES Crypto Algo
  static final G_encrypter =
  encrypt.Encrypter(encrypt.AES(l_key, mode: AESMode.cbc));

  //Methods

  String Fnc_Encrypt_AES(String lPlainText) {
    Encrypted lEncrypted = G_encrypter.encrypt(lPlainText, iv: initialization_vector);
    String lEncryptedText = lEncrypted.base64.toString();
    Get.put(lEncryptedText,tag:"Pass" );
    return lEncryptedText;
  }

  String Fnc_decrypted_AES( String lEncryptedText) {
    String lDecryptedText = G_encrypter.decrypt(lEncryptedText as Encrypted, iv: initialization_vector) ;
    return lDecryptedText;
  }

}
