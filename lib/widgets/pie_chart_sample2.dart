
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trello_01/widgets/indicator.dart';

class PieChartSample2 extends StatefulWidget {

  final double statusTodo;
  final double statusMaking;
  final double statusDue;
 

   const PieChartSample2({super.key, required this.statusDue, required this.statusMaking, required this.statusTodo});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Align(
      
      alignment: Alignment.bottomCenter,
      child: AspectRatio(
        aspectRatio:2,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18 ,
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 ,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 3,
                    centerSpaceRadius: 80,
                    sections: showingSections( ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xffBBBE64),
                  text: 'RIAIs CONCLUÍDAS',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xffFA824C),
                  text: 'RIAIs A FAZER',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff54527A),
                  text: 'RIAIs FAZENDO',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),                
              ],
            ),
            const SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
      
    );
  }


  List<PieChartSectionData> showingSections( )   {    
    
    return List.generate(3, (i) { 
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      
      switch (i) {
      
        case 0:
          return PieChartSectionData(
            color: Color(0xffBBBE64),
            borderSide: const BorderSide(color: Color(0xff7f8136), width: 3,),
            value: widget.statusDue ,
            title: '${widget.statusDue}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color:const  Color(0xffFA824C),
            borderSide: const BorderSide(color:  Color(0xffef5006), width: 3,),
           value: widget.statusTodo ,
            title: '${widget.statusTodo}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff), 
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff54527A),
            borderSide: const BorderSide(color: Color(0xff434162), width: 3,),
            value: widget.statusMaking,
            title: '${widget.statusMaking}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}


