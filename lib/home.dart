import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/cupertino.dart';

import 'package:encrypt/encrypt.dart' as encrypt;

class Encryption {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));
  static final farnetkey =
      encrypt.Key.fromUtf8('ABCDEFGHABCDEFGHABCDEFGHABCDEFGH');
  static final fernet = encrypt.Fernet(farnetkey);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  ///AES
  static encryptionAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print('Base 16');
    print(encrypted.base16);
    print('base64');
    print(encrypted.base64);

    return encrypted;
  }

  static decryptionAES(text) {
    final decrypted = encrypter.decrypt(text, iv: iv);

    print(decrypted);
    return decrypted;
  }

  ///Fernet
  static encryptionFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);

    print(encrypted.bytes);
    print('Base 16');
    print(encrypted.base16);
    print('base64');
    print(encrypted.base64);

    return encrypted;
  }

  static decryptionFernet(text) {
    final decrypted = encrypterFernet.decrypt(text);

    print(decrypted);
    return decrypted;
  }

  ///MD5
  static generateMd5(data) {
    return md5.convert(utf8.encode(data)).toString();
  }
}
