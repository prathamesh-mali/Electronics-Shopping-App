import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:elec_ecom_app/Models/product.dart';
import 'package:elec_ecom_app/widget/product_page.dart';
import 'package:elec_ecom_app/support/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final List<Product> items;
  final List categories;

  const ProductScreen({Key? key, required this.items, required this.categories})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Widget _gridItemHeader(Product product, BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 86,
          padding: const EdgeInsets.all(8),
          child: Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
        ),
        Consumer<AppData>(
          builder: (context, value, child) {
            value.initializeFavoriteProducts(value.getfilteredProducts());
            return IconButton(
              icon: value.getfilteredProducts()[index].isFavorite
                  ? const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: AppColors.favoriteLike,
                    )
                  : Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.grey[850],
                    ),
              onPressed: () {
                print(index);
                value.addToFavorite(index);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _gridItemFooter(Product product, context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "₹${product.off}",
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            "₹${product.price.toString()}",
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _gridItemBody(Product product, context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Image.asset(
        product.images[0],
        scale: 3,
        height: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Recommended Products",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("See all", style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
          GridView.builder(
            itemCount: value.filteredProducts.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 16,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              Product product = value.filteredProducts[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridTile(
                    header: _gridItemHeader(product, context, index),
                    footer: _gridItemFooter(product, context),
                    child: GestureDetector(
                      child: _gridItemBody(product, context),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              index: index,
                              product: product,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
