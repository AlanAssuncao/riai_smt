import 'package:flutter/material.dart';

class Header extends StatelessWidget {
 

  Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        
   return LayoutBuilder(
      builder: (_, constrains) {
        //final radius = min(constraints.maxHeight *0.1, constraints.maxWidth * 0.04);
        //final contraintsResult = constrains.maxWidth;
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            children: [
              Image.asset('assets/images/logo.png', width: 80, height: 40,),
              // const Text(
              //   'NÚMERO DA RIAI',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 11,
              //   ),
              // ),
              const SizedBox(
                width: 29,
                height: 50,
              ),
              const CircleAvatar(
                backgroundColor: Color(0xff0D5F82),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(child: Text('BACKLOG')),
                ),
              ),
              Expanded(
                child: Container(
                  width: constrains.maxWidth * 0.5,
                  height: 5,
                  color: Color(0xff0D5F82),            
                ),
              ),
              const CircleAvatar(  
                backgroundColor: Color(0xff0D5F82),       
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(child: Text('A FAZER')),
                ),
              ),
              Expanded(
                child: Container(
                  width: constrains.maxWidth * 0.5,
                  height: 5,
                  color: Color(0xff0D5F82),    
                ),
              ),
               const CircleAvatar(         
                backgroundColor: Color(0xff0D5F82),    
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(child: Text('FAZENDO')),
                ),
              ),
              Expanded(
                child: Container(
                  width: constrains.maxWidth * 0.5,
                  height: 5,
                  color: Color(0xff0D5F82),    
                ),
              ),
              const CircleAvatar(    
                backgroundColor: Color(0xff0D5F82),       
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(child: Text('FEITO' )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}




             