require 'bank_report_parser/parser'
describe BankReportParser::Parser, '.parse_csv' do
  let(:filepath) { "csvs/examples.csv" }
  let(:adapter) { double(:adapter, separator: ";").as_null_object }

  after { described_class.parse_csv(filepath, adapter) }

  it "reads each CSV row with headers" do
    expect(CSV).to receive(:foreach).with(filepath, headers: true, col_sep: adapter.separator)
  end

  it "tells the given adapter to parse each row" do
    csv_row = {}
    allow(CSV).to receive(:foreach).and_yield(csv_row)

    expect(adapter).to receive(:parse_row).with(csv_row)
  end

  it "creates a new row for each csv row" do
    csv_row, parsed_row = {}, {}
    allow(CSV).to receive(:foreach).and_yield(csv_row)
    allow(adapter).to receive(:parse_row).with(csv_row) { parsed_row }

    BankReportParser::Row.should_receive(:new).with(csv_row)
  end
end
