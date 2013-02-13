require 'spec_helper'

describe Boris::BusStop do

  def deep_underscore_keys obj
    case obj
    when Array
      obj.map { |obj| deep_underscore_keys obj }
    when Hash
      Hash[obj.map { |k,v| [ActiveSupport::Inflector.underscore(k).to_sym, deep_underscore_keys(v)] }]
    else
      obj
    end
  end

  let(:json) do
    JSON.parse File.read('./spec/fixtures/countdown.json')
  end

  let(:boris) { Boris::BusStop.find 51889 }

  before(:each) do
    HTTParty.stubs(:get).
      with('http://countdown.tfl.gov.uk/stopBoard/51889').
      returns stub(parsed_response: json)
  end

  describe '.find' do
    it 'makes a TFL API request' do
      HTTParty.expects(:get).
        with('http://countdown.tfl.gov.uk/stopBoard/51889').
        returns stub(parsed_response: json)

      Boris::BusStop.find 51889
    end
  end

  describe '#last_updated' do
    it 'returns a string representation of the last updated time' do
      boris.last_updated.should == json['lastUpdated']
    end
  end

  [:last_updated, :filter_out, :arrivals, :service_disruptions].each do |attr|
    describe "#{attr}" do
      it 'returns the value for the API response with keys underscored and symbolised' do
        hash = boris.send :deep_underscore_keys, json
        boris.send(attr).should == hash[attr]
      end
    end
  end

end
