import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cachoeira')),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            ImageDemo(),
            Description(),
            IconBar(),
            Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum suscipit, delectus sunt eaque accusamus assumenda illum provident sapiente eum corporis eveniet, exercitationem odit earum? Quo eligendi voluptatum dolorum eius. Ratione?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex, corporis? Doloremque, impedit ipsum iure voluptatibus iusto architecto magnam hic ipsam blanditiis suscipit quibusdam itaque corporis soluta quos alias numquam neque.",
                    textAlign: TextAlign.justify))
          ],
        )));
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final double sizeIcon;
  final String text;
  final Color textColor;

  const IconWithText(
      {super.key,
      required this.icon,
      required this.colorIcon,
      required this.sizeIcon,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: colorIcon,
          size: sizeIcon,
        ),
        Text(
          text,
          style: TextStyle(color: textColor),
        )
      ],
    );
  }
}

class IconBar extends StatelessWidget {
  const IconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconWithText(
              icon: Icons.call,
              colorIcon: Colors.deepPurple,
              sizeIcon: 30,
              text: "CALL",
              textColor: Colors.deepPurple),
          IconWithText(
              icon: Icons.near_me,
              colorIcon: Colors.deepPurple,
              sizeIcon: 30,
              text: "ROUTE",
              textColor: Colors.deepPurple),
          IconWithText(
              icon: Icons.share,
              colorIcon: Colors.deepPurple,
              sizeIcon: 30,
              text: "SHARE",
              textColor: Colors.deepPurple)
        ],
      ))
    ]);
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/montanhas.jpg",
      fit: BoxFit.cover,
      height: 220,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Olha essa cachoeira!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "São José do Sul - Rio Grande do Sul",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            ],
          )),
          Icon(Icons.star, color: Colors.red),
          Text("42")
        ],
      ),
    );
  }
}
