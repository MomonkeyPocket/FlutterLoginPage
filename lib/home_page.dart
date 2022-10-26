import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // 子要素をY軸に対して均等に配置
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 左寄せ
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              // 左寄せ
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FlutterLogo(
                  size: 40,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome to Flutter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Here comes lorem ipsum dummy test and its boring.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          curveDesignWidget(context),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)
                    ),
                    hintText: "Username or Email",
                  ),
                  onTap: () {},
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)
                    ),
                    hintText: "Password",
                  ),
                  onTap: () {},
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login to continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.indigoAccent.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 94, vertical: 25),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Continue in with Google"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Create a Flutter Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 72, vertical: 25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget curveDesignWidget(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          ClipPath(
            clipper: const CustomClipPath(clipHeight: 85),
            child: Container(
              height: 100,
              color: Colors.grey.shade200,
            ),
          ),
          ClipPath(
            clipper: const CustomClipPath(clipHeight: 60),
            child: Container(
              height: 70,
              color: Colors.indigoAccent.shade700,
            ),
          ),
          ClipPath(
            clipper: const CustomClipPath(clipHeight: 35),
            child: Container(
              height: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  final clipHeight;
  const CustomClipPath({required this.clipHeight});
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, height - 15);
    path.quadraticBezierTo(width * 0.5, height - 2, width, height - clipHeight);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
