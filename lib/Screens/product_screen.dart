import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:elec_ecom_app/Models/product.dart';
import 'package:elec_ecom_app/Screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.items,
  });
  final List<Product> items;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Widget _gridItemHeader(Product product, BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80,
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
            Product pdindex = value.getProducts()[index];
            value.initializeFavoriteProducts(value.getProducts());
            return IconButton(
              icon: value.getProducts()[index].isFavorite
                  ? const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.redAccent,
                    )
                  : Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.grey[850],
                    ),
              onPressed: () {
                value.addToFavorite(pdindex, index);
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
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Reccomended Products",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("See all", style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
        GridView.builder(
          itemCount: widget.items.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 10 / 16,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            Product product = widget.items[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
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
    );
  }
}
