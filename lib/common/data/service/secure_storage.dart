import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    )
  );
  static Future<void> write(String key,String value) async{
    try{await _storage.write(key: key, value: value);}
    catch(e){
      print('write 에러 $e');
    }
  }
  static Future<String?> read(String key) async {
    try{
     return await _storage.read(key: key);
    }
    catch(e) {
      print('write 에러 $e');
    }
    return null;
  }
  static Future<void> delete(String key) async {
    try{
      await _storage.delete(key: key);
    }
    catch(e){
      print('delete 에러 $e');
    }

  }
  static Future<void> deleteAll() async {
    try{
      await _storage.deleteAll();
    }
    catch(e){
      print('deleteAll 에러 $e');
    }
  }
}

