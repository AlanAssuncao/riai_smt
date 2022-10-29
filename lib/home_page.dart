import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:trello_01/models/board/board.dart';
import 'package:trello_01/modules/board_controller/board_controller.dart';
import 'package:trello_01/search_riai_service.dart';
import 'package:trello_01/widgets/bottom_navigation_bar_riai.dart';
import 'package:trello_01/widgets/card_detail_riai.dart';
import 'package:trello_01/widgets/navigation_rail_riai.dart';
import 'package:trello_01/widgets/header.dart';
import 'package:trello_01/widgets/pie_chart_sample2.dart';

import 'widgets/timeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexRiai = 0;
  bool isSelected = false;
  double statusTodo = 0;
  int statusMaking = 0;
  double statusDue = 0;
  Future<List<Board>>? result;
  Future<List<Board>>? resultFull;
  final fieldText = TextEditingController();

  @override
  void initState() {
    result = boardList();
    resultFull = result;

    super.initState();
  }

  Future<List<Board>> boardList() async {
    return BoardController().findAll();
  }

  @override
  Widget build(BuildContext context) {
    final _sizeWidth = MediaQuery.of(context).size.width;
    final _sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? const BottomNavigationBarRiai()
          : null,
      backgroundColor: const Color(0xffE9EAEC),
      body: SafeArea(
        child: Row(
          children: [
            if (_sizeWidth >= 640 && _sizeHeight > 300)
              const NavigationRailRiai(),
            Expanded(
              flex: 1,
              child: _sizeHeight >= 250
                  ? Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffb8b8b8), width: 4),
                          color: const Color(0xffb8b8b8),
                          borderRadius: BorderRadius.circular(30)),
                      child: FutureBuilder<List<Board>>(
                        future: result,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: fieldText,
                                  onChanged: (value) {
                                    if (value != '') {
                                      setState(() {
                                        if (result != null) {
                                          result = BoardController()
                                              .onChange(value, resultFull);
                                        }
                                      });
                                    } else {}
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Filtrar....',
                                    prefixIcon: Icon(Icons.search),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Color(0xffE9EAEC),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(70.0)),
                                      borderSide: BorderSide(
                                          color: Color(0xffb8b8b8), width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(70.0)),
                                      borderSide: BorderSide(
                                          color: Color(0xff0D5F82), width: 2),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: ListView(
                                    children: [Header()],
                                  ),
                                ),
                                const Divider(
                                  color: Color(0xff9FA4A9),
                                  thickness: 5,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            //result = BoardController().onChange('caixa');

                                            indexRiai = index;
                                          });
                                        },
                                        child: Timeline(
                                          numberDays:
                                              snapshot.data?[index].timeago ??
                                                  '',
                                          riaiName:
                                              snapshot.data?[index].name ?? '',
                                          riaiFullName:
                                              snapshot.data?[index].name ?? '',
                                          progress:
                                              snapshot.data?[index].list ?? '',
                                          statusLabel:
                                              snapshot.data?[index].label ?? '',
                                          isSelected:
                                              indexRiai == index ? true : false,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Sem conexão...'));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
                  : Container(),
            ),
            if (_sizeWidth >= 1150)
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                       
                      FutureBuilder<List<Board>>(
                          future: result,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return CardDetailRiai(
                                nameRiai: snapshot.data?[indexRiai].name ?? '',
                                due: snapshot.data?[indexRiai].due ?? '',
                                start: snapshot.data?[indexRiai].start ?? '',
                                menbers: snapshot.data?[indexRiai].nameMembers ?? [],
                                status: snapshot.data?[indexRiai].list ?? '',
                                label: snapshot.data?[indexRiai].label ?? '',
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                  child: Text('Sem conexão...'));
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      const SizedBox(height: 50),
                      
                      FutureBuilder<List<Board>>(
                        //GRÁFICO DE RIAI
                        future: result,
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            var todoCount = snapshot.data?.where((element) =>
                                element.list.contains('1- A FAZER'));

                            var makingCount = snapshot.data?.where((element) =>
                                element.list.contains('2- EM PROGRESSO'));

                            var dueCount = snapshot.data?.where((element) =>
                                element.list
                                    .contains('3- EXECUTADO NA SEMANA'));

                            return PieChartSample2(
                              statusDue: dueCount?.length.toDouble() ?? 1,
                              statusMaking: makingCount?.length.toDouble() ?? 1,
                              statusTodo: todoCount?.length.toDouble() ?? 1,
                            );
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Sem conexão...'));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
