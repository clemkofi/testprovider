import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Consumer<MyModel>(
              builder: (context, myModel, child) {
                return Text(myModel.someValue);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    //                  <--- Consumer
                    builder: (context, myModel, child) {
                      return TextField(
                        textAlign: TextAlign.center,
                        onChanged: (newValue) {
                          myModel.doSomething(newValue);
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
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

class MyModel with ChangeNotifier {
  //                          <--- MyModel
  String someValue = 'Hello';

  void doSomething(String newValue) {
    someValue = newValue;
    print(someValue);
    notifyListeners();
  }
}
