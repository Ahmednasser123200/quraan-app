import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String lable;
  final VoidCallback function;
  final double width, hight;
  final Color color;

  GeneralButton(
      {required this.lable,
      required this.function,
      required this.width,
      required this.hight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: color,
            fixedSize: Size(width, hight),
          ),
          child: Text(
            lable,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}

class GeneralButton2 extends StatelessWidget {
  final String lable;
  final VoidCallback function;
  final double width, hight;
  final Color color;
  final IconData icon;

  GeneralButton2(
      {required this.lable,
      required this.function,
      required this.width,
      required this.hight,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: color,
            fixedSize: Size(width, hight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                lable,textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          )),
    );
  }
}

class GeneralButton3 extends StatelessWidget {
  final String lable;
  final VoidCallback function;
  final double width, hight;
  final Color color;

  GeneralButton3(
      {required this.lable,
      required this.function,
      required this.width,
      required this.hight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: color,
            fixedSize: Size(width, hight),
          ),
          child: Text(
            lable,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }
}

class showmodelbottom extends StatelessWidget {
  final String lable;
  final VoidCallback function;
  final double width, hight;
  final Color color;
  final IconData icons;

  showmodelbottom({
    required this.lable,
    required this.function,
    required this.width,
    required this.hight,
    required this.color,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: color,
            fixedSize: Size(width, hight),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                icons,
                color: Colors.deepOrange,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                lable,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          )),
    );
  }
}
