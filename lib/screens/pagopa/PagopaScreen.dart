import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PagoPAScreen extends StatefulWidget {
  const PagoPAScreen({Key? key}) : super(key: key);

  @override
  State<PagoPAScreen> createState() => _PagoPAScreenState();
}

class _PagoPAScreenState extends State<PagoPAScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Inizializza WebView
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PagoPA"),
        backgroundColor: Colors.brown[900],
      ),
      body: WebView(
        initialUrl: 'https://applicazioni.regione.basilicata.it/pagamentionline/indexEnte.jsp?ente=80002950774',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}
