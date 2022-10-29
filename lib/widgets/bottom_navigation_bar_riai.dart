import 'package:flutter/material.dart';

class BottomNavigationBarRiai extends StatelessWidget {
  const BottomNavigationBarRiai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
     
      backgroundColor: Color(0xff2A293D),
      //currentIndex: _selectedIndex,
      elevation: 0,
      unselectedItemColor: Color.fromARGB(255, 108, 111, 112),
      selectedItemColor: const Color(0xffb8b8b8),
      onTap: (int index) {},
      items: const [
        
        BottomNavigationBarItem(
            backgroundColor: Color(0xff3C3D3E),
            icon: Icon(Icons.feed),
            label: 'RIAI'),    
             BottomNavigationBarItem(
            backgroundColor: Color(0xff3C3D3E),
            icon: Icon(Icons.feed),
            label: 'SMT'),        
            BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 80, 82, 83),
            icon: Icon(Icons.assessment_rounded),
            label: 'Detalhes'),
       
      ],
    );
  }
}
