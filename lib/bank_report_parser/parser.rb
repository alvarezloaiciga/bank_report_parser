require 'csv'
require_relative 'row'
module BankReportParser
  class Parser
    def self.parse_csv(filepath, adapter)
      CSV.foreach(filepath, headers: true) { |row| process_row adapter, row }
    end

    private
    def self.process_row(adapter, row)
      BankReportParser::Row.new(adapter.parse_row(row))
    end
  end
end
