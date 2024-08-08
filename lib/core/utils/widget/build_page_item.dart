import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guardzone/core/utils/icons/icons_theme.dart';



class BuildPageItem extends StatelessWidget {
  const BuildPageItem({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty || imageUrl == ''
        ? context.logo
        : _buildImageWidget(imageUrl!);
  }

  Widget _buildImageWidget(String imageUrl) {
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      // Si la URL comienza con 'http' o 'https', consideramos que es una URL de Internet
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    } else {
      // De lo contrario, asumimos que es una ruta local para un recurso de asset
      return Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
      );
    }
  }
}
