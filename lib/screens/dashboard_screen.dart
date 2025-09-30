import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Latar belakang abu-abu muda
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Teks Sapaan ---
            Text(
              'Selamat Datang,',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const Text(
              'Sulthon Aris Setiawan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // --- Kartu Saldo ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Saldo Saat Ini',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Rp 1.234.567',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E88E5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Lihat Detail Transaksi'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Menu Cepat ---
            const Text(
              'Menu Cepat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _quickMenu(Icons.add, 'Top Up'),
                _quickMenu(Icons.send, 'Transfer'),
                _quickMenu(Icons.receipt_long, 'Tagihan'),
                _quickMenu(Icons.more_horiz, 'Lainnya'),
              ],
            ),
            const SizedBox(height: 24),

            // --- Riwayat Transaksi ---
            const Text(
              'Transaksi Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  _transactionTile(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Belanja Tokopedia',
                    date: '29 Sep 2025',
                    amount: '-Rp 250.000',
                    isDebit: true,
                  ),
                  _transactionTile(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Top Up OVO',
                    date: '28 Sep 2025',
                    amount: 'Rp 500.000',
                    isDebit: false,
                  ),
                  _transactionTile(
                    icon: Icons.local_dining_outlined,
                    title: 'GoFood',
                    date: '27 Sep 2025',
                    amount: '-Rp 75.000',
                    isDebit: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget untuk menu cepat (ikon bulat + teks)
Widget _quickMenu(IconData icon, String label) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1E88E5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
      const SizedBox(height: 6),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}

/// Widget untuk daftar transaksi
class _transactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final bool isDebit;

  const _transactionTile({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    this.isDebit = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.blueGrey),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(date, style: const TextStyle(fontSize: 12)),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDebit ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
