module BankReportParser
  module Adapters
    class BNCR
      def self.process_row(csv_row)
        {
          id: csv_row["NumDocumento"],
          date: Time.new(csv_row["FechaMovimiento"]),
          ammount: csv_row["Debito"] || csv_row["Credito"],
          description: csv_row["Descripcion"],
          type: type(csv_row)
        }
      end

      private

      def self.type(csv_row)
        csv_row["Debito"] ? :debit : :credit
      end
    end
  end
end
