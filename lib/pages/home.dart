import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => _HomeState();

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}