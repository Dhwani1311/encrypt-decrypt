
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_encryption/home.dart';

void main() {
    runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController pass = TextEditingController();

  var cipherText,plainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Encryption/Decryption")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Enter Some  Text',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.lightBlueAccent
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.blue[400]
                      )
                  ),
                ),
                cursorColor: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Text('Plain Text'),
                Padding(padding: EdgeInsets.all(10),
                  child:Text(plainText == null ? '' : plainText) ,)
              ],
            ),
            Column(
              children: [
                Text('Encrypted Text'),
                Padding(padding: EdgeInsets.all(10),
                  child: Text(cipherText == null ? '' : cipherText is encrypt.Encrypted ? cipherText.base64 : cipherText),),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                plainText = pass.text;
                setState(() {
                  cipherText =  Encryption.encryptionAES(plainText);
                });

              },
              child: Text("Encrypt"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                 cipherText = Encryption.decryptionAES(cipherText);
                });

              },
              child: Text("Decrypt"),
            ),

          ],
        ),

      ),
    );
  }
}