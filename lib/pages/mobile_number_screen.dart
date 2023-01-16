import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth/pages/verification_page.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  static String verify = "";

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var phone = "";

  @override
  void initState() {
    countryCodeController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please enter your mobile number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You\'ll receive a 6 digit code to verify next',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),

            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      height: 30,
                      width: 20,
                      child: Image.asset('assets/images/flag.png')),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                      width: 35,
                      child: TextField(
                        controller: countryCodeController,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      )),
                  const Text(
                    '-',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mobile Number',
                    ),
                  )),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countryCodeController.text + phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MobileNumberScreen.verify = verificationId;
                      Navigator.of(context).pushNamed('/verify');
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  // Navigator.of(context).pushNamed(MaterialPageRoute(builder: (context) => VerificationScreen(phoneNUmber: phone)));
                  // Navigator.of(context).pushNamed(MaterialPageRoute(builder: (context) => VerificationScreen(phoneNUmber: phoneController)));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => VerificationScreen(mobileNumberFromPreviousScreen: phoneController.text.toString(),),),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E3B62),
                  elevation: 0,
                  shape: const BeveledRectangleBorder(),
                ),
                child: const Text(
                  'CONTINUE',
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
