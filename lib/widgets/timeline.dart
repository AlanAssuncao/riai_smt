import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  String? progress;
  String? statusLabel;
  String riaiName;
  String riaiFullName;
  String numberDays;
  bool? isSelected;

  Timeline({
    Key? key,
    this.progress,
    required this.numberDays,
    this.statusLabel,
    required this.riaiName,
    required this.riaiFullName,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final height = size.height;
    // final width = size.width;

    Color color1 = Colors.black12;
    Color color2 = Colors.black12;
    Color color3 = Colors.black12;
    Color color4 = Colors.black12;
    Widget child1 = const Text('');
    Widget child2 = const Text('');
    Widget child3 = const Text('');
    Widget child4 = const Text('');

    switch (progress) {
      case '0- BACKLOG':
        {
          color1 = const Color(0xff01baef);
          color2 = Colors.grey.shade300;
          color3 = Colors.grey.shade300;
          color4 = Colors.grey.shade300;
          child1 = Text(
            numberDays,
            style: const TextStyle(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
          );
          child2 = const Text('');
          child3 = const Text('');
          child4 = const Text('');
        }
        break;
      case '1- A FAZER':
        {
          color1 = const Color(0xff01baef);
          color2 = const Color(0xff01afdf);
          color3 = Colors.grey.shade300;
          color4 = Colors.grey.shade300;
          child1 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child2 = Text(
            numberDays,
            style: const TextStyle(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
          );
          child3 = const Text('');
          child4 = const Text('');
        }
        break;
      case '2- EM PROGRESSO':
        {
          color1 = const Color(0xff01baef);
          color2 = const Color(0xff01afdf);
          color3 = const Color(0xff019fcb);
          color4 = Colors.grey.shade300;
          child1 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child2 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child3 = Text(
            numberDays,
            style: const TextStyle(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
          );
          child4 = const Text('');
        }
        break;
      case '3- EXECUTADO NA SEMANA':
        {
          color1 = const Color(0xff01baef);
          color2 = const Color(0xff01afdf);
          color3 = const Color(0xff019fcb);
          color4 = const Color(0xff018fb7);
          child1 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child2 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child3 = const Icon(
            Icons.check,
            color: Colors.black,
          );
          child4 = const Icon(
            Icons.check,
            color: Colors.black,
          );
        }
        break;
      default:
    }

    return LayoutBuilder(
      builder: (_, constrains) {
        //final radius = min(constrains.maxHeight *0.1, constrains.maxWidth * 0.04);
        return Container(
          padding: EdgeInsets.all(8),
          // ignore: prefer_const_literals_to_create_immutables
          decoration: isSelected!
              ? BoxDecoration(
                  color: const Color(0xffA9ADB1),
                  border: Border.all(color: const Color(0xffA9ADB1), width: 4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 116, 115, 115),
                        offset: Offset(0.0, 5.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ])
              : null,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        riaiName.length < 11 ? riaiFullName : riaiFullName.substring(0,11),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 79,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        decoration: statusLabel == ''
                            ? BoxDecoration(
                                color: const Color(0xff9FA4A9),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : statusLabel == 'APROVADA'
                                ? BoxDecoration(
                                    color: const Color(0XFF20bf55),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : statusLabel == 'EM TESTE'
                                    ? BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 189, 212, 82),
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                        child: statusLabel == ''
                            ? const Text(
                                '- - - - - - - ',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              )
                            : Text(
                                statusLabel.toString(),
                                style: const TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundColor: color1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: child1,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: constrains.maxWidth * 0.5,
                      height: 5,
                      color: color2,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: color2,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: child2,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: constrains.maxWidth * 0.5,
                      height: 5,
                      color: color3,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: color3,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: child3,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: constrains.maxWidth * 0.5,
                      height: 5,
                      color: color4,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: color4,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: child4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  riaiFullName.length <12 ? riaiFullName : riaiFullName.substring(13,riaiFullName.length),
                  style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 136, 136, 136)),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
