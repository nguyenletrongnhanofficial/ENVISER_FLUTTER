import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/challenge/widgets/item_add_image.dart';
import 'package:uit_hackathon/features/challenge/widgets/item_image.dart';

class ItemUploadGroup extends StatefulWidget {
  final List<File> images;

  const ItemUploadGroup({
    super.key,
    required this.images,
  });

  @override
  State<ItemUploadGroup> createState() => _ItemUploadGroupState();
}

class _ItemUploadGroupState extends State<ItemUploadGroup> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.images.isEmpty ? 1 : widget.images.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.images.length) {
          return ItemAddImage(
            index: index,
            callback: (image) {
              setState(() {
                widget.images.add(image);
              });
            },
          );
        }

        return ItemImage(
          index: index,
          callback: (i) {
            setState(() {
              widget.images.removeAt(i);
            });
          },
          image: widget.images[index],
        );
      },
    );
  }
}
