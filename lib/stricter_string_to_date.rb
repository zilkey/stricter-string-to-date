require 'active_support'
require 'active_support/core_ext/date'
require 'active_support/core_ext/string/conversions'
require 'active_support/core_ext/object/blank'
require 'active_support/deprecation'

String.class_eval do
  def to_date
    unless blank?
      begin
        date_values = ::Date._parse(self, false).values_at(:year, :mon, :mday)
        ::Date.new(*date_values)
      rescue NoMethodError => e
        if e.message == "undefined method `div' for nil:NilClass"
          parsed_date = ::Date.parse(self, false) rescue nil
          if parsed_date
            message = %Q{"#{self}".to_date will become a valid date "#{parsed_date}"}
            ActiveSupport::Deprecation.warn message
          else
            message = %Q{"NoMethodError: undefined method `div' for nil:NilClass" will raise "ArgumentError: Invalid Date" in "ActiveSupport: 4.0"}
            ActiveSupport::Deprecation.warn message
          end
        end
        raise e
      end
    end
  end
end
