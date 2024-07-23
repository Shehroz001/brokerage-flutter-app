import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define a custom class for the blog post
class BlogPost {
  final String title;
  final String imageUrl;
  final String description;

  BlogPost({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  // Example static data for the blogs
  final List<BlogPost> blogs = [
    BlogPost(
      title: 'Tesla',
      imageUrl:
          'https://static.pakwheels.com/2023/09/project-highland-concept-750x430.jpg',
      description:
          'Six years after the first Model 3 Performance deliveries, we are launching the new Model 3 Performance: a highly differentiated performance trim that leverages Tesla’s latest manufacturing and engineering capabilities to create what we consider to be a perfect, high-performance daily driver.',
    ),
    BlogPost(
      title: 'Jeff Bezos',
      imageUrl: 'https://dudeperf3ct.github.io/images/senseis/jeff.jpg',
      description:
          'As a senior executive you get paid to make small number of high quality decisions. Your job is not to make 1000s of decisions everyday. Is that worth it if the quality of decisions is low because you are tired, grouchy or any number of things.',
    ),
    BlogPost(
      title: 'Warren Buffett',
      imageUrl:
          'https://image.cnbcfm.com/api/v1/image/106405967-15825476788691u8a3338.jpg?v=1633459202&w=740&h=416&ffmt=webp&vtcrop=y',
      description:
          'Rational people dont risk what they have and need for what they dont have and dont need.',
    ),
    // Add more blog posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blogs',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          blog.imageUrl,
                          width: width,
                          height: height * 0.3,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          blog.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          blog.description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
