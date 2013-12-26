require 'csv'
module BankReportParser
  class Parser
    def self.parse_csv(filepath, adapter)
      CSV.foreach(filepath, headers: true) do |row|
        adapter.parse_row(row)
      end
    end
  end
end
