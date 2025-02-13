import 'package:exam_box/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../constants/imageConstant.dart';
import 'home_screen.dart';
import 'splash_screen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    Key? key,
    this.tabIndexId,
    this.tabIndex,
  }) : super(key: key);

  final tabIndexId;
  final tabIndex;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void checkBottomIndex() {
    setState(() {
      tabIndexs = widget.tabIndexId != null ? widget.tabIndexId : 0;
      print("tabIndexs$tabIndexs");
    });
  }

  var tabIndexs = 0;
  void _onItemTapped(int index) {
    setState(() {
      tabIndexs = index;
      print(index);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              BottomNavigation(tabIndexId: tabIndexs),
        ),
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    checkBottomIndex();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabIndexs == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OnBoardingPageBody(),
            ),
          );
        
        } else if (tabIndexs == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigation(tabIndex: 1, tabIndexId: 0),
            ),
          );
        } else if (tabIndexs == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigation(tabIndex: 0, tabIndexId: 0),
            ),
          );
        } else if (tabIndexs == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigation(tabIndex: 0, tabIndexId: 0),
            ),
          );
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: tabIndexs,
              children: [
                HomeScreen(),
                Container(child: Center(child: Text('My Tests'),) ,),
                Container(child: Center(child: Text('Tutors'),) ,),
                Container(child: Center(child: Text('Lectures'),) ,),
                Container(child: Center(child: Text('Classroom'),) ,),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withOpacity(0.5), 
                spreadRadius: 2, 
                blurRadius: 8, 
                offset: Offset(
                    0, 3), 
              ),
            ],
          ),
          child: BottomNavigationBar(
            unselectedItemColor: Gray,
            selectedItemColor: PrimaryColor,
            onTap: _onItemTapped,
            currentIndex: tabIndexs,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors
                .transparent, 
            elevation: 0, 
            items: [
              _bottomNavigationBarItem(
                icon: Image.asset(
                 Images.HOME_ICON,
                  width: 24,
                  height: 24,
                    color:     tabIndexs == 0 ? PrimaryColor:Gray,
                ),
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Image.asset(
                  Images.TEST_ICON,
                  width: 24,
                  height: 24,
                  color: tabIndexs == 1 ? PrimaryColor : null,
                ),
                label: 'My Tests',
              ),
              _bottomNavigationBarItem(
                icon: Image.asset(
                  Images.TUTORS_ICON,
                  width: 24,
                  height: 24,
                  color: tabIndexs == 2 ? PrimaryColor : null,
                ),
                label: 'Tutors',
              ),
              _bottomNavigationBarItem(
                icon: Image.asset(
                  Images.LECTURES_ICON,
                  width: 24,
                  height: 24,
                  color: tabIndexs == 3 ? PrimaryColor : null,
                ),
                label: 'Lectures',
              ),
              _bottomNavigationBarItem(
                icon: Image.asset(
                  Images.CLASSROOM_ICON,
                  width: 24,
                  height: 24,
                  color: tabIndexs == 4 ? PrimaryColor : null,
                ),
                label: 'Classroom',
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  

  _bottomNavigationBarItem({required icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
