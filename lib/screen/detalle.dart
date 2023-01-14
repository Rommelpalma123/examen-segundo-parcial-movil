import 'package:flutter/material.dart';

import '../models/bike.dart';
import 'home.dart';


class Detalle extends StatelessWidget
{
  final Bike bike;

  const Detalle(this.bike, {super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar( automaticallyImplyLeading: false ),
      body: Column(
          children: [
            ListTile(
                  title: Text(bike.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(bike.country)
                    ],
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bike.latitude,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(30,12,30,12),
                ),
              child: const Text('done', style: TextStyle(fontSize: 20)),
              onPressed: ()
        {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
        },
              )
        )],
        
      ),
    );
  }
}