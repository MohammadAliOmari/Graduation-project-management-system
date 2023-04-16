import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  bool _showList1 = false;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  bool _showList2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Chose Your Major',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _showList1 = true;
                          _showList2 = false;
                          color1 = const Color(0xff01b397);
                          color2 = Colors.grey;
                        });
                      },
                      child: const Text(
                        'CS',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _showList1 = false;
                          _showList2 = true;
                          color2 = const Color(0xff01b397);
                          color1 = Colors.grey;
                        });
                      },
                      child: const Text(
                        'CIS|MIS',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (_showList1)
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('List 1 Item $index'));
                    },
                  ),
                ),
              if (_showList2)
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('List 2 Item $index'));
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
