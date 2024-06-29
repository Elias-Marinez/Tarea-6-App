import 'package:flutter/material.dart';

class TopHomeContent extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? imageUrl;
  final String? imagePath;

  const TopHomeContent({
    super.key,
    this.icon,
    this.title,
    this.imageUrl,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null && title != null) {
      return _buildContentWithIconAndTitle();
    } else if (imageUrl != null) {
      return _buildContentWithImageUrl();
    } else if (imagePath != null) {
      return _buildContentWithImagePath();
    } else {
      return const SizedBox();
    }
  }

  Widget _buildContentWithIconAndTitle() {
    return Column(
      children: [
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon!,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContentWithImageUrl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          imageUrl!,
          fit: BoxFit.fitHeight,
          height: 200,
        ),
      ],
    );
  }

  Widget _buildContentWithImagePath() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(imagePath!),
          ),
        ),
      ],
    );
  }
}