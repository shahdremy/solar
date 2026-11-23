import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Splash(),
));

const red = Color(0xFFE53935);

class Planet {
  final String name, image, title, about, distance, day, orbit, radius,
      mass, gravity, area;
  const Planet(this.name, this.image, this.title, this.about, this.distance,
      this.day, this.orbit, this.radius, this.mass, this.gravity, this.area);
}

const planets = [
  Planet(
      'Sun',
      'assets/sun.png',
      "The Sun: Our Solar System's Star",
      "The Sun is the heart of our solar system, a massive ball of plasma that provides heat, light, and energy to everything within its gravitational pull. Its immense size and temperature are fueled by nuclear fusion, a process that combines hydrogen atoms into helium, releasing vast amounts of energy. The Sun's magnetic field, which is constantly changing, influences solar activity like sunspots and solar flares.",
      '0', '0', '0', '695,700', '1.989 × 10³⁰', '274', '6.09 × 10¹²'),
  Planet(
      'Mercury',
      'assets/mercury.png',
      'Mercury: The Closest Planet',
      "Mercury is the smallest planet and the closest to the Sun. It has almost no atmosphere, so its surface is covered in craters and swings between extreme heat by day and freezing cold at night.",
      '57,909,227', '1,407.60', '0.24', '2,439.70', '3.301 × 10²³', '3.7', '7.48 × 10⁷'),
  Planet(
      'Venus',
      'assets/venus.png',
      "Venus: Earth's Toxic Twin",
      "Venus is often referred to as Earth's twin due to its similar size and composition. However, its thick atmosphere, composed primarily of carbon dioxide, traps heat, making it the hottest planet in our solar system. Venus is also shrouded in a thick layer of sulfuric acid clouds, which reflect sunlight and give it a yellowish appearance.",
      '108,209,072', '5,832.20', '0.62', '6,051.80', '4.867 × 10²⁴', '8.87', '4.60 × 10⁸'),
  Planet(
      'Earth',
      'assets/earth.png',
      'Earth: Our Blue Marble',
      "Earth is the only known planet in the universe that supports life. Its unique combination of factors, including liquid water, a breathable atmosphere, and a suitable distance from the Sun, has created the ideal conditions for the development of complex organisms. Earth's magnetic field protects it from harmful solar radiation.",
      '149,598,026', '23.93', '1', '6,371', '5.972 × 10²⁴', '9.81', '5.10 × 10⁸'),
  Planet(
      'Mars',
      'assets/mars.png',
      'Mars: The Red Planet',
      "Mars, often called the Red Planet due to its reddish hue caused by iron oxide, is a cold, rocky world with a thin atmosphere. It has polar ice caps, ancient riverbeds, and evidence of past volcanic activity, suggesting that it once had a warmer, wetter climate.",
      '227,943,824', '24.62', '1.88', '3,389.50', '6.39 × 10²³', '3.71', '1.45 × 10⁸'),
  Planet(
      'Jupiter',
      'assets/jupiter.png',
      'Jupiter: The Gas Giant',
      "Jupiter is the largest planet in our solar system, a gas giant composed primarily of hydrogen and helium. Its Great Red Spot, a massive storm that has been raging for centuries, is a testament to its turbulent atmosphere. Jupiter has a strong magnetic field and numerous moons, including Europa.",
      '778,547,669', '9.92', '11.86', '69,911', '1.898 × 10²⁷', '24.79', '6.21 × 10¹⁵'),
  Planet(
      'Saturn',
      'assets/saturn.png',
      'Saturn: The Ringed Planet',
      "Saturn is best known for its spectacular rings, which are composed of countless ice particles and rocks. It is a gas giant with a composition similar to Jupiter. Saturn's largest moon, Titan, has a thick atmosphere and is the only known celestial body outside of Earth with liquid lakes and rivers.",
      '1,426,666,422', '10.66', '29.46', '58,232', '5.683 × 10²⁶', '10.44', '4.27 × 10¹⁵'),
  Planet(
      'Uranus',
      'assets/uranus.png',
      'Uranus: The Tilted Planet',
      "Uranus is an ice giant with a unique axial tilt, causing its seasons to be extreme. It is surrounded by faint rings and has numerous moons, including Miranda, known for its chaotic terrain. Its atmosphere is composed primarily of hydrogen, helium, and methane, giving it a pale blue color.",
      '2,870,990,000', '17.24', '84.01', '25,362', '8.681 × 10²⁵', '8.69', '8.1 × 10¹⁵'),
  Planet(
      'Neptune',
      'assets/neptune.png',
      'Neptune: The Distant World',
      "Neptune is the farthest planet from the Sun and is another ice giant. Its atmosphere is similar to Uranus, but it is a deeper blue color due to the presence of methane. Neptune has several moons, including Triton, which orbits the planet in a retrograde direction.",
      '4,498,252,900', '16.11', '164.8', '24,622', '1.024 × 10²⁶', '11.15', '7.65 × 10¹⁵'),
];

Widget curvedTop(Planet p, int i) => ClipRRect(
  borderRadius:
  const BorderRadius.vertical(bottom: Radius.elliptical(500, 120)),
  child: AnimatedSwitcher(
    duration: const Duration(milliseconds: 400),
    child: Image.asset(p.image,
        key: ValueKey('bg$i'),
        width: double.infinity,
        height: 260,
        fit: BoxFit.cover),
  ),
);

Widget redCircle(IconData icon, VoidCallback onTap) => ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: red,
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(12),
  ),
  onPressed: onTap,
  child: Icon(icon, color: Colors.white),
);

class Splash extends StatelessWidget {
  const Splash({super.key});

  void chooseVersion(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF0B0B0B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text('Choose your version',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(children: [
              for (final is3D in [false, true]) ...[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: red,
                      shape: const StadiumBorder(),
                      minimumSize: const Size.fromHeight(52),
                    ),
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PlanetsScreen(use3D: is3D)));
                    },
                    child: Text(is3D ? '3D' : 'Normal',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16)),
                  ),
                ),
                if (!is3D) const SizedBox(width: 12),
              ],
            ]),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
          top: 40,
          bottom: 90,
          left: -w * 0.55,
          width: w * 1.5,
          child: Image.asset('assets/mars.png', fit: BoxFit.contain),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text('Explore\nThe\nUniverse',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    height: 1.3,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(56),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                onPressed: () => chooseVersion(context),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Explore',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class PlanetsScreen extends StatefulWidget {
  final bool use3D;
  const PlanetsScreen({required this.use3D, super.key});

  @override
  State<PlanetsScreen> createState() => _PlanetsScreenState();
}

class _PlanetsScreenState extends State<PlanetsScreen> {
  int i = 0;
  int dir = 1;

  void go(int d) => setState(() {
    dir = d;
    i = (i + d + planets.length) % planets.length;
  });

  @override
  Widget build(BuildContext context) {
    final p = planets[i];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
            top: 0, left: 0, right: 0, height: 260, child: curvedTop(p, i)),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Row(children: [
                redCircle(Icons.arrow_back, () => Navigator.pop(context)),
                const Expanded(
                  child: Center(
                    child: Text('Explore',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 48),
              ]),
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Which planet\nwould you like to explore?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 450),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                        begin: Offset(dir.toDouble(), 0), end: Offset.zero)
                        .animate(anim),
                    child: child,
                  ),
                ),
                child: widget.use3D
                    ? ModelViewer(
                  key: ValueKey('m$i'),
                  src: 'assets/models/${p.name.toLowerCase()}.glb',
                  alt: p.name,
                  autoRotate: true,
                  disableZoom: true,
                  cameraControls: true,
                  backgroundColor: Colors.black,
                )
                    : Image.asset(p.image, key: ValueKey('m$i')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    redCircle(Icons.arrow_back, () => go(-1)),
                    Text(p.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    redCircle(Icons.arrow_forward, () => go(1)),
                  ]),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(56),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            Details(p, i, use3D: widget.use3D))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Explore ${p.name}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16)),
                      const Icon(Icons.arrow_forward,
                          color: Colors.white, size: 20),
                    ]),
              ),
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ]),
    );
  }
}

class Details extends StatelessWidget {
  final Planet p;
  final int index;
  final bool use3D;
  const Details(this.p, this.index, {required this.use3D, super.key});

  Widget row(String k, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: Text(k, style: const TextStyle(color: Colors.white70))),
      Text(v,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    ]),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    body: Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 260,
          child: curvedTop(p, index)),
      SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Row(children: [
              redCircle(Icons.arrow_back, () => Navigator.pop(context)),
              Expanded(
                child: Center(
                  child: Text(p.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 48),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 320,
                      width: double.infinity,
                      child: use3D
                          ? ModelViewer(
                        src:
                        'assets/models/${p.name.toLowerCase()}.glb',
                        alt: p.name,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        backgroundColor: Colors.black,
                      )
                          : Image.asset(p.image),
                    ),
                    const SizedBox(height: 16),
                    const Text('About',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(p.about,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.5)),
                    const Divider(color: Colors.white24, height: 32),
                    row('Distance from Sun (km)', p.distance),
                    row('Length of Day (hours)', p.day),
                    row('Orbital Period (Earth years)', p.orbit),
                    row('Radius (km)', p.radius),
                    row('Mass (kg)', p.mass),
                    row('Gravity (m/s²)', p.gravity),
                    row('Surface Area (km²)', p.area),
                  ]),
            ),
          ),
        ]),
      ),
    ]),
  );
}