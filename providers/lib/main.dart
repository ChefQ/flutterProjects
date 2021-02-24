import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
        create: (context) =>
            MyModel(), // create myModel and allow access to all widgets in the widget tree

        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
              appBar: AppBar(title: Text('My App')),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.green[200],
                    child:
                        Consumer<MyModel>(builder: (context, myModel, child) {
                      return RaisedButton(
                          onPressed: () {
                            myModel.doSomething();
                          },
                          child: Text('Do something'));
                    }),
                  ),
                  Container(
                      padding: const EdgeInsets.all(35),
                      color: Colors.blue[200],
                      child: Consumer<MyModel>(
                        builder: (__, myModel, _) {
                          return Text(myModel.someValue);
                        },
                      ))
                ],
              )),
        ));
  }
}

class MyModel with ChangeNotifier {
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}
