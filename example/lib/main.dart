import 'package:flutter/material.dart';
import 'package:do_dart/do_dart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigitalOcean Dart Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DigitalOcean Dart Demo!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Client client;
  Account account;
  List<Droplet> droplets = List();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter DigitalOcean API Key",
                ),
                maxLines: 1,
                onSubmitted: (value) => initClient(value),
              ),
            ),
            Text(
              "ACCOUNT",
            ),
            account != null
                ? Column(children: <Widget>[
                    Text(
                      "uuid: " + account.uuid,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                      "email: " + account.email,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Droplets',
                            style: Theme.of(context).textTheme.display1)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                        child: (DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Size")),
                        DataColumn(label: Text("Memory")),
                        DataColumn(label: Text("Disk"))
                      ],
                      rows: getRows(),
                    ))),
                  ])
                : Text("Nothing loaded")
          ]),
    );
  }

  List<DataRow> getRows() {
    List<DataRow> _ = List();
    for (Droplet d in droplets) {
      DataCell name = DataCell(Text(d.name));
      DataCell sizeSlug = DataCell(Text(d.size_slug));
      DataCell memory = DataCell(Text(d.memory.toString()));
      DataCell disk = DataCell(Text(d.disk.toString()));
      _.add(DataRow(cells: <DataCell>[name, sizeSlug, memory, disk]));
    }

    return _;
  }

  Future<void> initClient(String text) async {
    setState(() {
      client = Client(text);
    });

    Account _account = await client.account.get();
    Droplets _droplets = await client.droplet.list();
    setState(() {
      account = _account;
      droplets = _droplets.droplets;
    });
    print(_account.email);
  }
}
