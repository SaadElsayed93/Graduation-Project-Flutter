import 'package:city/core/widgets/build_boxes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const CarouselWithIndicators(),
            const SizedBox(height: 20.0),
            // Services Section
            BuildBoxes(title: 'الخدمات الحكومية'),
            _buildBoxesSection('المشاكل'),
            _buildBoxesSection('طلب الخدمات'),
          ],
        ),
      ),
    );
  }

  Widget _buildBoxesSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 100.0, // Height of the box row
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6, // Number of boxes
            itemBuilder: (context, index) {
              return Container(
                width: 90.0, // Width of each box
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Same color as the background
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$title ${index + 1}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0), // Space between rows
      ],
    );
  }
}

class CarouselWithIndicators extends StatefulWidget {
  const CarouselWithIndicators({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      'caption': ' المكسيكي'
    },
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': " رابعه حاسبات "
    },
    {
      'url': 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
      'caption': 'التخرج '
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
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10.0),
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
