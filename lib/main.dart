import 'package:TasbihFida/splashscreen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const TasbihApp());
}

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbih Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade700),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2E7D32), // hijau gelap
            letterSpacing: 1.2,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF388E3C),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFF4CAF50),
          ),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TasbihHomePage extends StatefulWidget {
  const TasbihHomePage({super.key, required this.title});
  final String title;

  @override
  State<TasbihHomePage> createState() => _TasbihHomePageState();
}

class _TasbihHomePageState extends State<TasbihHomePage> {
  int _dzikirCount = 0;
  int _rekapInterval = 33;
  final List<int> _rekapList = [];
  final TextEditingController _controller = TextEditingController(text: '33');

  void _incrementDzikir() {
    setState(() {
      _dzikirCount++;
      if (_dzikirCount % _rekapInterval == 0) {
        _rekapList.add(_dzikirCount);
      }
    });
  }

  void _resetDzikir() {
    setState(() {
      _dzikirCount = 0;
      _rekapList.clear();
    });
  }

  void _updateRekapInterval() {
    final input = int.tryParse(_controller.text);
    if (input != null && input > 0) {
      setState(() {
        _rekapInterval = input;
        _rekapList.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan angka yang valid!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: textTheme.titleLarge?.copyWith(color: Colors.white)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetDzikir,
            tooltip: 'Reset',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hitungan Dzikir',
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
            ),
            Center(
              child: Text(
                '$_dzikirCount',
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Text('Rekap tiap: ', style: textTheme.bodyMedium),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukkan angka rekap (misal 33)',
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF81C784)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF388E3C)),
                      ),
                    ),
                    style: const TextStyle(color: Color(0xFF2E7D32)),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _updateRekapInterval,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(72, 40),
                  ),
                  child: const Text('Atur'),
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFF81C784),
            ),
            const SizedBox(height: 24),
            Text(
              'Rekap',
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Total Rekap: ${_rekapList.length}',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Expanded(
  child: _rekapList.isEmpty
      ? const Center(
          child: Text(
            "Belum ada rekap.",
            style: TextStyle(color: Color(0xFF4CAF50)),
          ),
        )
      : Scrollbar( // Tambahkan Scrollbar untuk visual scroll
          child: ListView.builder(
            itemCount: _rekapList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.check_circle, color: Color(0xFF388E3C)),
                title: Text(
                  'Hitungan ke-${_rekapList[index]}',
                  style: const TextStyle(color: Color(0xFF2E7D32)),
                ),
              );
            },
          ),
        ),
),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 192,
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.fingerprint, size: 28,color: Colors.white,),
                label: const Text(
                  'Dzikir',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                onPressed: _incrementDzikir,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Developed by PATITECH.ID',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            
          ],
        ),
      ),
    );
  }
}
