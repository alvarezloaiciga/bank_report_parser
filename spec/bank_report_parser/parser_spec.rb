require 'bank_report_parser/parser'
describe BankReportParser::Parser, '.parse_csv' do
  let(:filepath) { "csvs/examples.csv" }
  let(:adapter) { double(:adapter).as_null_object }

  after { described_class.parse_csv(filepath, adapter) }

  it "reads each CSV row with headers" do
    expect(CSV).to receive(:foreach).with(filepath, headers: true)
  end

  it "tells the given adapter to parse each row" do
    row = double(:row)
    allow(CSV).to receive(:foreach).and_yield(row)

    expect(adapter).to receive(:parse_row).with(row)
  end
end
