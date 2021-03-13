import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/cartpage.dart';
import 'package:flutter_application_restaurant/discoverpage.dart';
import 'package:flutter_application_restaurant/favouritiespage.dart';
import 'package:flutter_application_restaurant/homepage.dart';
import 'package:flutter_application_restaurant/profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _pagelist;

  Home _homeScreen = Home();
  Discover _discoverScreen = Discover();
  Favourities _favouritiesScreen = Favourities();
  Profile _profileScreen = Profile();

  @override
  void initState() {
    super.initState();
    _pagelist = [
      _homeScreen,
      _discoverScreen,
      _favouritiesScreen,
      _profileScreen
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      floatingActionButton: _buildFloating,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottom,
    );
  }

  PageController _scroller = PageController();

  get _buildBody {
    return Container(
      child: PageView(
        controller: _scroller,
        physics: NeverScrollableScrollPhysics(),
        children: _pagelist,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  get _buildFloating {
    return FloatingActionButton(
      child: Icon(Icons.shopping_cart_rounded),
      backgroundColor: Colors.orange,
      onPressed: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        });
      },
    );
  }

  get _buildBottom {
    return BottomNavigationBar(
        iconSize: 30,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded),
            // ignore: deprecated_member_use
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              // ignore: deprecated_member_use
              title: Text("Discover")),
          BottomNavigationBarItem(
              icon: Icon(Icons.grade_rounded),
              // ignore: deprecated_member_use
              title: Text("Favourites")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              // ignore: deprecated_member_use
              title: Text("Profile"))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _scroller.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        });
  }

  // get _showAlertDialog {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(
  //             "Cart",
  //             style: TextStyle(color: Colors.orange),
  //           ),
  //           content: Container(
  //             height: 400,
  //             width: 300,
  //             child: Container(
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey,
  //                       borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(5),
  //                         topRight: Radius.circular(5),
  //                         bottomLeft: Radius.circular(5),
  //                         bottomRight: Radius.circular(5),
  //                       ),
  //                     ),
  //                     child: Container(
  //                       child: Column(
  //                         children: [
  //                           ListTile(
  //                             leading: Text("Subtotal"),
  //                             trailing: Text("100.00"),
  //                           ),
  //                           Divider(
  //                             color: Colors.white,
  //                           ),
  //                           ListTile(
  //                             leading: Text("Total"),
  //                             trailing: Text("100.00"),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Card(
  //                     child: ListTile(
  //                       leading: Icon(Icons.delete),
  //                       title: Text("Delete"),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   Navigator.of(context).pop();
  //                 });
  //               },
  //               child: Text("Cancel"),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
