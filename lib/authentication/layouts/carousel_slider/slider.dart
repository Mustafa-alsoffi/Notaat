/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_marketing/shared/bloc/bloc_state.dart';
import 'package:notes_marketing/shared/bloc/cubit.dart';

class Slider_Carousel extends StatefulWidget {

  @override
  State<Slider_Carousel> createState() => _Slider_CarouselState();
}

class _Slider_CarouselState extends State<Slider_Carousel> {
  List imagelist=[
    'asstes/images/m1.jpg',
    'asstes/images/m2.jpg',
    'asstes/images/m3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Slider 1 : Initial index page 0 \n\n\n",
            textAlign: TextAlign.center,
          ),
          CarouselSlider(
            items: imagelist.map((imgurl){
              return Container(
                width: double.infinity,
                child: Image.asset(imgurl,fit:BoxFit.fill),
              );
            }).toList(),
            options: CarouselOptions(initialPage: 0,height: 180),
          ),
        ],
      ),
    );
  }
}
*/
