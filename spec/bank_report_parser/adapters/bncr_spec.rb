require 'bank_report_parser/adapters/bncr'

describe BankReportParser::Adapters::BNCR, ".process_row" do
  let(:row) { {
    "Oficina" => 228,
    "FechaMovimiento" => "2013/12/20",
    "NumDocumento" => 132342,
    "Debito" => nil,
    "Credito" => 61.00,
    "Descripcion" => "Pago carro"
  } }

  subject { described_class.process_row(row) }

  its([:id]) { should == 132342 }
  its([:date]) { should == Time.new("2013/12/20") }
  its([:ammount]) { should == 61.00 }
  its([:description]) { should == "Pago carro" }

  context "when row is a credit" do
    before do
      row["Debito"] = nil
      row["Credito"] = 61.00
    end

    its([:type]) { should == :credit }
  end

  context "when row is a debit" do
    before do
      row["Debito"] = 61.00
      row["Credito"] = nil
    end

    its([:type]) { should == :debit }
  end
end
