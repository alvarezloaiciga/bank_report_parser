module BankReportParser
  module Adapters
    class LAFISE
      def self.process_row(csv_row)
        {
          id: csv_row["Autorización"],
          date: Time.new(csv_row["Fecha"]),
          ammount: csv_row["Monto"],
          description: csv_row["Transacción"],
          type: :debit
        }
      end
    end
  end
end
