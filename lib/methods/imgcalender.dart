import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './imgPick.dart';

class ImageCalen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageCalen();
  }
}

class _ImageCalen extends State<ImageCalen> {
  DateTime currentDate = DateTime.now();
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.all(15),
              height: 150,
              child: Center(
                  child: TextField(
                controller: dateinput,
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2050));

                  if (pickedDate != null && pickedDate != currentDate) {
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    setState(() {
                      currentDate = pickedDate;
                      dateinput.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              )))),
      Expanded(
          flex: 3,
          child: Container(
            child: GetImage(),
          ))
    ])));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _portraitMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ImageCalen(),
              )
            ]),
      ],
    );
  }

  Widget _landscapeMode() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ImageCalen(),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
    );
  }
}
