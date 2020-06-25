import 'package:char_converter/bloc/convert_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocDelegate {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (BuildContext context) => ConvertBloc(),
          child: ConvertChar()),
    );
  }
}

class ConvertChar extends StatelessWidget {
  final charConverter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ConvertBloc _converBloc = BlocProvider.of<ConvertBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Converting Characters'),
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<ConvertBloc, String>(
            builder: (BuildContext context, state) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter Word'),
                    keyboardType: TextInputType.text,
                    controller: charConverter,
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {
                      _converBloc
                          .add(ConvertToUpper(textString: charConverter.text));
                    },
                    child: Text('Upper'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _converBloc
                          .add(ConvertToLower(textString: charConverter.text));
                    },
                    child: Text('Lower'),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text('$state', style: TextStyle(fontSize: 22)),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
