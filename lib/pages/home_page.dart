import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/reusable_elevated_button.dart';
import 'mobile_number_screen.dart';

// enum LanguageOptions{ENGLISH,HINDI}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _languageList = ["ENGLISH", "HINDI"];
  String? _selectedVal = "ENGLISH";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/album.png',
                
                // height: 80,
                // width: 80,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Please select your Language',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You can change the language at any time',
              style: TextStyle(color: Colors.grey),
            ),
          
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 210,
              child: DropdownButtonFormField(
                value: _selectedVal,
                items: _languageList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedVal = val;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             SizedBox(
              width: 210,
              height: 70,
              child: ElevatedButton(
        
        onPressed: (){
         Navigator.of(context).pushNamed('/mobile');
        },
       
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color(0xff2E3B62),
          elevation: 0,
          shape:const BeveledRectangleBorder(),
         
        ),
         child: const Text(
          'NEXT',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        ),
            ),
            // const SizedBox(height: 50,),
            //    Image.asset('assets/images/bottom.png'),
          ]),
    );
  }
}
