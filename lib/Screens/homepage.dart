import 'package:elec_ecom_app/Screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:elec_ecom_app/Data/app_data.dart';
import 'categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        leading: const Icon(
          FontAwesomeIcons.shopware,
          size: 30,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Prathamesh !",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Let's go Shopping!",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   width: 400,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: const [],
            //   ),
            // ),
            const ElecCategories(),
            ProductScreen(
              items: AppData.products,
            ),
          ],
        ),
      ),
    );
  }
}
