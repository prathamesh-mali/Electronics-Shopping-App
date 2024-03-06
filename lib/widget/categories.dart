import 'package:elec_ecom_app/Constants/AppColors.dart';
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
  @override
  void initState() {
    super.initState();
    final appData = Provider.of<AppData>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      appData.filterItemsByCategory(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Column(
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
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    constraints: BoxConstraints.tight(const Size(55, 20)),
                    decoration: BoxDecoration(
                      color: widget.categories[index].isSelected == false
                          ? const Color(0xFFE5E6E8)
                          : AppColors.blueAcc,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        value.filterItemsByCategory(index);
                      },
                      child: Icon(
                        widget.categories[index].icon,
                        color: value.getCategory()[index].isSelected
                            ? Colors.white
                            : const Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
