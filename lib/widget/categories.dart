import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product_category.dart';

class ElecCategories extends StatefulWidget {
  const ElecCategories({Key? key, required this.categories}) : super(key: key);

  final List<ProductCategory> categories;

  @override
  State<ElecCategories> createState() => _ElecCategoriesState();
}

class _ElecCategoriesState extends State<ElecCategories> {
  void initState() {
    super.initState();
    final appData = Provider.of<AppData>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      appData
          .filterItemsByCategory(0); // Assuming index 0 is for "all" category
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Container(
        child: Column(
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
                      .bodyText1
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 65,
                    width: 75,
                    decoration: BoxDecoration(
                      color: widget.categories[index].isSelected == false
                          ? const Color(0xFFE5E6E8)
                          : const Color(0xFFf16b26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        value.filterItemsByCategory(index);
                      },
                      child: Icon(
                        widget.categories[index].icon,
                        color: value.getCategory()[index].isSelected
                            ? const Color(0xFFA6A3A0)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
