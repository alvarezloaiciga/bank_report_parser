module BankReportParser
  class Row
    def initialize(attrs = {})
      attrs.each do |k, v|
        self.class.send(:define_method, k) { v }
      end
    end
  end
end
