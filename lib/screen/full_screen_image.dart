// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FullScreenImageScreen extends StatefulWidget {
  final List<String>? imageUrls;
  final int currentIndex;

  const FullScreenImageScreen(
      {super.key, required this.imageUrls, required this.currentIndex});

  @override
  _FullScreenImageScreenState createState() => _FullScreenImageScreenState();
}

class _FullScreenImageScreenState extends State<FullScreenImageScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _goToPreviousImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _goToNextImage() {
    if (_currentIndex < widget.imageUrls!.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.imageUrls![_currentIndex],
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: _goToPreviousImage,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                onPressed: _goToNextImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
