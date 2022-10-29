import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDetailRiai extends StatelessWidget {
  String nameRiai;
  String? due;
  String? start;
  List<String>? menbers;
  String status;
  String? label;
  CardDetailRiai(
      {Key? key,
      required this.nameRiai,
      this.due,
      this.start,
      this.menbers,
      required this.status,
      this.label,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff54527a), width: 4),
            color: const Color(0xff5C5A87),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xffE9EAEC),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Text(
                nameRiai,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FittedBox(
                      child: Text('Data de Abertura:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(start != ""
                        ? DateFormat("dd/MM/y")
                            .format(DateTime.parse(start.toString()))
                        : ''),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text('Data de Encerramento:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                      width: 5,
                    ),
                    Text(due !=  ""
                        ? DateFormat("dd/MM/y")
                            .format(DateTime.parse(due.toString()))
                        : ''),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Membros: ',
                  
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    menbers.toString().replaceAll('[', '').replaceAll(']', ''),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Quadro:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(status.split('-').last),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    width: 150,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: label == ''
                        ? BoxDecoration(
                            color: const Color(0xff9FA4A9),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : label == 'APROVADA'
                            ? BoxDecoration(
                                color: const Color(0XFF20bf55),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : label == 'EM TESTE'
                                ? BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 189, 212, 82),
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                    child: label == ''
                        ? const Text(
                            '- - - - - - - ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            label.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                  ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Observações:',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
