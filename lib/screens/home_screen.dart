import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search For..?',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Carousel Slider with text overlay
          CarouselWithIndicators(),
        ],
      ),
    );
  }
}

class CarouselWithIndicators extends StatefulWidget {
  const CarouselWithIndicators({super.key});

  @override
  _CarouselWithIndicatorsState createState() => _CarouselWithIndicatorsState();
}

class _CarouselWithIndicatorsState extends State<CarouselWithIndicators> {
  int _currentIndex = 0;

  final List<Map<String, String>> _imageData = [
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': 'محمد رمضان'
    },
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': 'عبفتاح المكسيكي'
    },
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': 'مش مهم'
    },
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': '..'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _imageData.map((data) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    data['url']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    color: Colors.black.withOpacity(0.15),
                    child: Text(
                      data['caption']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _imageData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? const Color(0xFF3D6643)
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
