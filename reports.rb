require 'report_builder'
options = {
   input_path: Dir["reports/*.json"],
   report_path: 'reports/pretty_report',
   report_types: ['html'],
   report_title: 'Relatório de Execução dos Testes'
 }

ReportBuilder.build_report options