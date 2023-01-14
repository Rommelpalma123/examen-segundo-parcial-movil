// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/bike.dart';
import 'detalle.dart';


class Home extends StatelessWidget 
{
  const Home({super.key});
  @override
Widget build(BuildContext context) 
{
    return Scaffold(
      appBar: AppBar(
        title: const Text('examen'),
      ),
      body: Container(
        child: Card( child:  FutureBuilder(
          future: getBikes(),
          builder: (context, snapshot)
          {
            if(snapshot.data == null)
            {
              return Container(
                child: Center(child: Text('Cargando los datos'),)
              );
            }
            else
            {
              return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, index)
              {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].country),
                  trailing: Text(snapshot.data[index].latitude),
                );
              });
              // ignore: dead_code
              ListTile(
                onTap: ()
                {
                },);
            }
          },
        ),),
      )
      );
}
}


Future getBikes() async 
  {
    final response = await http.get(Uri.https('api.citybik.es','v2/networks'));
    List bikes = [];
    if (response.statusCode == 200) 
    {
      final Map data = jsonDecode(response.body);
      for (var item in data["networks"])
      {
        bikes.add(Bike(item["name"], item["location"]["country"].toString(), item["location"]["latitude"].toString()));
        print('los datos fueron traidos con exito');
        print(data.length);
      }
      return bikes;
    } 
    else  
    {
      throw Exception("ocurrio un error al traer los datos");
    }
  }