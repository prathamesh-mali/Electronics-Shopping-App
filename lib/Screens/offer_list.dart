import 'package:flutter/material.dart';

class OfferList extends StatefulWidget {
  const OfferList({super.key});

  @override
  State<OfferList> createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 100,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "30% Off During Covid 19",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Get Now")),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(1),
                  child: Image.asset(
                    "assets/images/shopping.png",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
