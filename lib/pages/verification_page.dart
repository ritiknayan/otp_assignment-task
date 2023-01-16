// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'mobile_number_screen.dart';

class VerificationScreen extends StatelessWidget {

  late var mobileNumberFromPreviousScreen;
  
   VerificationScreen({
    Key? key,
     this.mobileNumberFromPreviousScreen,
  }) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 56,
    //   textStyle: TextStyle(
    //       fontSize: 20,
    //       color: Color.fromARGB(255, 216, 228, 238),
    //       fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Color.fromARGB(237, 218, 223, 227)),
    //     borderRadius: BorderRadius.circular(0),
    //   ),
    // );

    // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    //   border: Border.all(color: Color.fromARGB(255, 179, 205, 230)),
    //   borderRadius: BorderRadius.circular(0),
    // );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: Color.fromARGB(255, 195, 223, 243),
    //   ),
    // );
    var code = "";
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Verify Phone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              'Code is send to $mobileNumberFromPreviousScreen ' ,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),

            //textfield for otp
            SizedBox(
              width: 335,
             
              child: Pinput(
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
                // onCompleted: (pin) => print(pin),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Didn\'t receive the code?',
                  // textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {}, 
                    style: TextButton.styleFrom(
                      
                    ),
                    child: const Text('Request Again',style: TextStyle(color: Colors.black),),),
              ],
            ),

           const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: 330,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: MobileNumberScreen.verify,
                            smsCode: code);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamed(context, '/profile');
                  } catch (e) {
                    print('wrong otp');
                  }

                  Navigator.pushReplacementNamed(context, '/profile');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E3B62),
                  elevation: 0,
          shape:const BeveledRectangleBorder(),
                ),
                child: const Text(
                  'VERIFY AND CONTINUE',
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
