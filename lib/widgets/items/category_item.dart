import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.blue[800], borderRadius: BorderRadius.circular(12)),
          child: Icon(
            categoryModel.icon,
            color: Colors.white,
            size: 26,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          overflow: TextOverflow.fade,
          maxLines: 2,
          categoryModel.Title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
