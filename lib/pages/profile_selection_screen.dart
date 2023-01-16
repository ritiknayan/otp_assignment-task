import 'package:flutter/material.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  bool _isSelected1 = false;
   bool _isSelected2 = false;

  // bool _isTapped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please select your profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
        
            Container(
              margin: const EdgeInsets.only(left: 11, right: 11),
              padding: const EdgeInsets.all(10),
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                GestureDetector(
                    
                     onTap: () {
                      setState(() {
                        _isSelected1 = !_isSelected1;
                        if(_isSelected1 == true){
                          _isSelected2 = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _isSelected1 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: _isSelected1
                            ? Border.all(color: Colors.black, width: 1.0)
                            : Border.all(color: Colors.black, width: 1.0),
                      ),
                      width: 30,
                      height: 30,
                      child: _isSelected1
                          ? const Icon(
                              Icons.circle_rounded,
                              color: Color(0xff2E3B62),
                              size: 25,
                            )
                          : null,
                    ),
                  )  ,
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/images/home.png',
                    width: 70,
                  ),
                  // const Icon(Icons.warehouse_outlined,size: 90,),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Shipper',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Lorem ipsum dolor site amet,',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'consecutetur adipiscing',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            Container(
              margin: const EdgeInsets.only(left: 11, right: 11),
              padding: const EdgeInsets.all(10),
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    
                     onTap: () {
                      setState(() {
                        _isSelected2 = !_isSelected2;
                        if(_isSelected2 == true){
                          _isSelected1 = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _isSelected2 ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: _isSelected2
                            ? Border.all(color: Colors.black, width: 1.0)
                            : Border.all(color: Colors.black, width: 1.0),
                      ),
                      width: 30,
                      height: 30,
                      child: _isSelected2
                          ? const Icon(
                              Icons.circle_rounded,
                              color: Color(0xff2E3B62),
                              size: 25,
                            )
                          : null,
                    ),
                  )  ,
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/images/truck.png',
                    width: 70,
                  ),
                  // const Icon(
                  //   Icons.local_shipping_outlined,
                  //   size: 90,
                  // ),

                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Transporter',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Lorem ipsum dolor site amet,',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'consecutetur adipiscing',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 210,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/verify');
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
          ]),
    );
  }
}
