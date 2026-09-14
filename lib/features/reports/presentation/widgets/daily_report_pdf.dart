import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../domain/daily_report.dart';

const _pdfBrandColor = PdfColor.fromInt(0xFF578732);

/// Mobile equivalent of the web `/reports/daily` page's "Export PDF"/
/// "Print" buttons combined into one: builds a clean, brand-colored PDF of
/// the current report and hands it to the OS share/print sheet
/// (`Printing.layoutPdf`) — the same sheet covers "save to Files", "share
/// via WhatsApp/email", and "print" in one native flow, so a single Export
/// button is enough (unlike web, which has room for two separate buttons).
Future<void> exportDailyReportPdf({
  required DailyReport report,
  required String organisationName,
  required String periodLabel,
  String? branchLabel,
}) async {
  final doc = pw.Document();
  final summary = report.summary;
  final logoBytes = await rootBundle.load('assets/images/app_logo.png');
  final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(28),
      header: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Row(
                children: [
                  pw.Image(logoImage, width: 32, height: 32),
                  pw.SizedBox(width: 8),
                  pw.Text(
                    'PYPE CRM',
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: _pdfBrandColor),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Daily Performance Report', style: const pw.TextStyle(fontSize: 12)),
                  pw.Text(periodLabel, style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Container(
            padding: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(color: PdfColors.grey100, borderRadius: pw.BorderRadius.circular(6)),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(organisationName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                if (branchLabel != null) pw.Text('Branch: $branchLabel', style: const pw.TextStyle(fontSize: 10)),
              ],
            ),
          ),
          pw.SizedBox(height: 12),
        ],
      ),
      build: (context) => [
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
          columnWidths: const {
            0: pw.FlexColumnWidth(2.4),
            1: pw.FlexColumnWidth(1.2),
            2: pw.FlexColumnWidth(1),
            3: pw.FlexColumnWidth(1),
            4: pw.FlexColumnWidth(1),
            5: pw.FlexColumnWidth(1),
            6: pw.FlexColumnWidth(1),
          },
          children: [
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: _pdfBrandColor),
              children: [
                for (final label in ['User', 'Branch', 'Calls', 'Connected', 'Unconn.', 'Converted', 'Lost'])
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Text(
                      label,
                      style: pw.TextStyle(color: PdfColors.white, fontSize: 9, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
              ],
            ),
            for (final row in report.table)
              pw.TableRow(
                children: [
                  _cell(row.userName, bold: true),
                  _cell(row.branch ?? '-'),
                  _cell('${row.totalCalls}', center: true),
                  _cell('${row.totalConnected}', center: true),
                  _cell('${row.totalUnconnected}', center: true),
                  _cell('${row.totalConverted}', center: true),
                  _cell('${row.totalLost}', center: true),
                ],
              ),
            if (report.table.isEmpty)
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('No activity recorded for this period.', style: const pw.TextStyle(fontSize: 9)),
                  ),
                  for (var i = 0; i < 6; i++) pw.Container(),
                ],
              ),
          ],
        ),
        if (summary != null) ...[
          pw.SizedBox(height: 18),
          pw.Text('Summary', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          pw.Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _summaryTile('Total Calls', '${summary.totalCalls}', _formatDuration(summary.totalDuration)),
              _summaryTile('Incoming', '${summary.incoming}', _formatDuration(summary.incomingDuration)),
              _summaryTile('Outgoing', '${summary.outgoing}', _formatDuration(summary.outgoingDuration)),
              _summaryTile('Missed', '${summary.missed}', null),
              _summaryTile('Rejected', '${summary.rejected}', null),
              _summaryTile('Never Attended', '${summary.neverAttended}', null),
              _summaryTile('Not Picked Up', '${summary.notPickedUp}', null),
              _summaryTile('Unique Numbers', '${summary.unique}', null),
            ],
          ),
        ],
      ],
    ),
  );

  await Printing.layoutPdf(onLayout: (_) => doc.save());
}

pw.Widget _cell(String text, {bool bold = false, bool center = false}) => pw.Padding(
  padding: const pw.EdgeInsets.all(6),
  child: pw.Text(
    text,
    textAlign: center ? pw.TextAlign.center : pw.TextAlign.left,
    style: pw.TextStyle(fontSize: 9, fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal),
  ),
);

pw.Widget _summaryTile(String label, String value, String? sub) => pw.Container(
  width: 120,
  padding: const pw.EdgeInsets.all(8),
  decoration: pw.BoxDecoration(
    border: pw.Border.all(color: PdfColors.grey300, width: 0.5),
    borderRadius: pw.BorderRadius.circular(6),
  ),
  child: pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
      pw.SizedBox(height: 2),
      pw.Text(value, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
      if (sub != null) pw.Text(sub, style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
    ],
  ),
);

String _formatDuration(int totalSeconds) {
  final m = totalSeconds ~/ 60;
  final s = totalSeconds % 60;
  return '${m}m ${s}s';
}
