require 'csv'
require_relative 'row'
module BankReportParser
  class Parser
    def self.parse_csv(filepath, adapter)
      CSV.foreach(filepath, headers: true) do |row|
        BankReportParser::Row.new(adapter.parse_row(row))
      end
    end
  end
end
