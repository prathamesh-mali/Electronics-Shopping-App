import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ElecCategories extends StatelessWidget {
  const ElecCategories({super.key});

  // final mobile = FontAwesomeIcons.mobileScreenButton;
  // final watch = FontAwesomeIcons.watchmanMonitoring;
  // final headphones = FontAwesomeIcons.headphones;
  // final tablets = FontAwesomeIcons.tabletScreenButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
            child: Text("Top Categories",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500))),
        SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  width: 75,
                  child: const Icon(FontAwesomeIcons.mobileScreenButton),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  width: 75,
                  child: const Icon(Icons.watch),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  width: 75,
                  child: const Icon(FontAwesomeIcons.tabletScreenButton),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  width: 75,
                  child: const Icon(FontAwesomeIcons.headphones),
                ),
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 35.0, horizontal: 5.0),
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
