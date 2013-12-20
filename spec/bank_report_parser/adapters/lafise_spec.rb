require 'bank_report_parser/adapters/lafise'

describe BankReportParser::Adapters::LAFISE, ".process_row" do
  let(:row) { {
    "Fecha" => "2013/12/20",
    "Autorización" => 132342,
    "Moneda" => "COL",
    "Monto" => 18000,
    "Transacción" => "Pago carro"
  } }

  subject { described_class.process_row(row) }

  its([:id]) { should == 132342 }
  its([:date]) { should == Time.new("2013/12/20") }
  its([:ammount]) { should == 18000 }
  its([:description]) { should == "Pago carro" }
  its([:type]) { should == :debit }
end
