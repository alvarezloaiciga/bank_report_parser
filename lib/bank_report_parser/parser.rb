require 'csv'
require_relative 'row'
module BankReportParser
  class Parser
    def self.parse_csv(filepath, adapter)
      rows = []
      CSV.foreach(filepath, headers: true, col_sep: adapter.separator) { |row| rows << process_row(adapter, row) }
      rows
    end

    private
    def self.process_row(adapter, row)
      BankReportParser::Row.new(adapter.parse_row(row))
    end
  end
end
