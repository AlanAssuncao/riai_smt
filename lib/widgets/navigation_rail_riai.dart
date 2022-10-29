import 'package:flutter/material.dart';
import 'package:trello_01/widgets/card_detail_riai.dart';
import 'package:trello_01/widgets/pie_chart_sample2.dart';

class NavigationRailRiai extends StatelessWidget {
  const NavigationRailRiai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIconTheme: const IconThemeData(
        color: const Color(0xfffffbff),
      ),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      backgroundColor: const Color(0xff2A293D),
      groupAlignment: 0.1,      
      onDestinationSelected: (int index) {},
      selectedIndex: 0,
      destinations:  const [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(icon: Icon(Icons.feed), label: Text('RIAI')),
        NavigationRailDestination(icon: Icon(Icons.feed), label: Text('SMT')),
        
      ],
      labelType: NavigationRailLabelType.all,
      unselectedLabelTextStyle: const TextStyle(color: Colors.grey),

    );
  }
}
