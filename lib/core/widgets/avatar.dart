import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String imageUrl;
  final double size; 

  const ProfileIcon({
    super.key,
    required this.imageUrl,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Profile image
        CircleAvatar(
          radius: size / 2,
          backgroundImage: AssetImage(imageUrl), // Use NetworkImage if image URL is online
        ),
        
        // Edit icon
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6), 
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6), 
            child: Icon(
              Icons.edit, // Edit icon
              color: Colors.white,
              size: size * 0.15, 
            ),
          ),
        ),
      ],
    );
  }
}
