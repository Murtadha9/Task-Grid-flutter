import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataGrid'),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
          Navigator.of(context).pushReplacementNamed('grid');
        },
           color: Colors.greenAccent, 
           elevation: 5.0,
           height: 60.0, 
           minWidth: 200.0, 
           padding: const EdgeInsets.all(16.0), 
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), 
          ),
        child: const Text('Click Here' , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),)
        ),
    );
  }
}