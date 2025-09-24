# Not much to see here
require "date"
require "time"
require "bigdecimal"
require "prawn"
require "prawn/table"
require "prawn-svg"
require "money"

if Money.respond_to?(:locale_backend=)
  Money.locale_backend = :currency
end

if Money.respond_to?(:rounding_mode=)
  Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
end

require_relative "payday/version"
require_relative "payday/config"
require_relative "payday/i18n"
require_relative "payday/line_itemable"
require_relative "payday/line_item"
require_relative "payday/pdf_renderer"
require_relative "payday/invoiceable"
require_relative "payday/invoice"
