require 'bank_report_parser/row'
describe BankReportParser::Row, '.new' do
  A_ROW_ID = 12345
  A_ROW_DATE = Time.new
  A_ROW_AMMOUNT = 685.21
  A_ROW_DESCRIPTION = "Description"
  A_ROW_TYPE = :credit

  subject { described_class.new({
    id: A_ROW_ID,
    date: A_ROW_DATE,
    ammount: A_ROW_AMMOUNT,
    description: A_ROW_DESCRIPTION,
    type: A_ROW_TYPE
  }) }

  its(:id) { should == A_ROW_ID }
  its(:date) { should == A_ROW_DATE }
  its(:ammount) { should == A_ROW_AMMOUNT }
  its(:description) { should == A_ROW_DESCRIPTION }
  its(:type) { should == A_ROW_TYPE }
end
