import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:elec_ecom_app/widget/product_page.dart';
import 'package:elec_ecom_app/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 10),
              child: const Text(
                "Favorites",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.favoriteProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                      product: value.favoriteProducts[index],
                                      index: index)));
                        },
                        visualDensity: const VisualDensity(vertical: 4),
                        tileColor: AppColors.darkGrey,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        title: Text(
                          value.favoriteProducts[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                                'Discounted Price: ₹${value.favoriteProducts[index].off.toString()}'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '₹${value.favoriteProducts[index].price.toString()}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        trailing: Image.asset(value
                            .favoriteProducts[index].images.firstOrNull
                            .toString()),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
