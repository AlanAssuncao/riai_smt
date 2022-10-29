import 'package:flutter/material.dart';

class RiaiBoard extends StatefulWidget {
  const RiaiBoard({Key? key}) : super(key: key);

  @override
  State<RiaiBoard> createState() => _RiaiBoardState();
}

class _RiaiBoardState extends State<RiaiBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return Container(
              margin: const EdgeInsets.all(40),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      width: constrains.maxWidth * 0.25,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 50.0,
                              offset: Offset(0, -1))
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: Colors.grey,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'FANEM',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'BACKLOG',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      width: constrains.maxWidth * 0.25,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      color: Colors.grey,
                      child: const Text(
                        'A FAZER',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      width: constrains.maxWidth * 0.25  ,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      color: Colors.grey,
                      child: const Text(
                        'FAZENDO',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      width: constrains.maxWidth * 0.25,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 500.0,
                              offset: Offset(0, -1))
                        ],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.grey,
                      ),
                      child: const Text(
                        'FEITO',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
