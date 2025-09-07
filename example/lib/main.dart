import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';

void main() {
  runApp(const PackageExampleApp());
}

class PackageExampleApp extends StatelessWidget {
  const PackageExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Adaptive UI Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive Adaptive UI Demo')),
        body: Builder(
          builder: (context) {
            // Initialize responsive helper
            Responsive.init(context);

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Responsive Container
                  Container(
                    width: Responsive.w(80),
                    height: Responsive.h(15),
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        "Responsive Box",
                        style: TextStyle(fontSize: Responsive.sp(18)),
                      ),
                    ),
                  ),
                  Responsive.height(5),

                  // ResponsiveText
                  const ResponsiveText(
                    "This text adapts between 14 and 28 size",
                    min: 14,
                    max: 28,
                    textAlign: TextAlign.center,
                  ),
                  Responsive.height(5),

                  // AdaptiveButton
                  AdaptiveButton(
                    onPressed: () {
                      debugPrint("Adaptive Button Pressed");
                    },
                    color: Colors.green,
                     child: Text("Adaptive Button", style: TextStyle(fontSize: Responsive.sp(16))),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
