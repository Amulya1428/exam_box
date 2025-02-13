import 'package:exam_box/Screens/bottom_navigation.dart';
import 'package:exam_box/constants/constants.dart';
import 'package:flutter/material.dart';

class CreateProfileOptionsScreen extends StatefulWidget {
  const CreateProfileOptionsScreen({super.key});

  @override
  State<CreateProfileOptionsScreen> createState() =>
      _CreateProfileOptionsScreenState();
}

class _CreateProfileOptionsScreenState extends State<CreateProfileOptionsScreen> {
  List<String> namelist = [
    'GATE-2025',
    'NEET',
    'JEE',
    'GRE',
    'IELTS/TOEFL/DUOLINGO',
    'GATE- 2025',
    'NEET ',
    'HIGH SCHOOL MATHEMATICS',
  ];

  Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: tGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/icon 1.png'),
              SizedBox(width: 10),
              Text(
                "CREATE PROFILE",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: PrimaryColor,
                ),
              )
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: White,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [tBoxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Which Test are you Preparing for?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      namelist.length,
                      (index) {
                        bool isSelected = selectedOptions.contains(namelist[index]);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedOptions.remove(namelist[index]);
                              } else {
                                selectedOptions.add(namelist[index]);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isSelected ? PrimaryColor : LightGray,  
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              namelist[index],
                              style: TextStyle(
                                color: isSelected ? White : Black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      boxShadow: [BoxShadow(color: Colors.black)],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (selectedOptions.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigation()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select at least one option.'),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(double.maxFinite, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
