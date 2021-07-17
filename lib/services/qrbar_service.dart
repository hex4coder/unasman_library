import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeService {
  /// fungsi untuk scan barcode dari buku
  static Future<String> scanBarcode() async {
    String barcodeText = '';

    // munculkan barcode scanner
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#1e90ff', 'Batal', true, ScanMode.DEFAULT);
    if (barcodeScanRes.length > 0) {
      barcodeText = barcodeScanRes;
    }

    return barcodeText;
  }
}
