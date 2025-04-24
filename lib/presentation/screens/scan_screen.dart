// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String? qrText;
  bool isScanned = false;

  void _handleBarcode(BarcodeCapture capture) {
    if (isScanned || capture.barcodes.isEmpty) return;

    final barcode = capture.barcodes.first;
    final value = barcode.rawValue;

    if (value == null) return;

    setState(() {
      qrText = value;
      isScanned = true;
    });
  
    debugPrint('Scanned QR Code: $value');
    
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Attendance"),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              facing: CameraFacing.back,
              detectionSpeed: DetectionSpeed.normal,
              torchEnabled: false,
            ),
            onDetect: _handleBarcode,
          ),
          if (isScanned)
            Container(
              color: Colors.black.withOpacity(0.8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle, color: Colors.greenAccent, size: 100),
                      const SizedBox(height: 20),
                      const Text("QR Code Detected!",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      const SizedBox(height: 10),
                      Text(
                        qrText ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isScanned = false;
                            qrText = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        icon: const Icon(Icons.restart_alt),
                        label: const Text("Scan Again"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
