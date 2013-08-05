require 'rspec'
require_relative '../lib/stricter_string_to_date'

describe String do

  describe "#to_date" do

    context "with a date that was invalid in ActiveSupport 3.2.13" do
      it "should raise the same method that ActiveSupport 3.2.13" do
        expect do
          capture(:stderr) { "333".to_date }
        end.to raise_error(NoMethodError, "undefined method `div' for nil:NilClass")
      end
    end

    context "the date is valid in ActiveSupport 4.0" do
      it "should render a deprecation warning about the date becoming valid" do
        stderr_output = capture(:stderr) { expect { "333".to_date }.to raise_error }
        stderr_output.should include(%Q{DEPRECATION WARNING: "333".to_date will become a valid date "#{Date.parse("333")}"})
      end
    end

    context "the date is also invalid in ActiveSupport 4.0" do
      it "should render a deprecation warning about the exception class change" do
        stderr_output = capture(:stderr) { expect{ "asdf".to_date }.to raise_error }
        stderr_output.should include(%Q{DEPRECATION WARNING: "NoMethodError: undefined method `div' for nil:NilClass" will raise "ArgumentError: Invalid Date" in "ActiveSupport: 4.0"})
      end
    end

  end

end
