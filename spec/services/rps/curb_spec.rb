RSpec.describe RPS::Curb do
  let(:test_uri) { 'http://test.test' }

  before { allow(Rails.application.credentials).to receive(:curb_uri).and_return(test_uri) }

  describe 'play' do
    subject { described_class.new.play }

    it "returns Curb's move" do
      stub_request(:any, test_uri).to_return(status: 200, body: "{\n    \"statusCode\": 200,\n    \"body\": \"rock\"\n}")

      expect(subject).to eq 'rock'
    end

    it 'raises an error when Curb is not responding' do
      stub_request(:any, test_uri).to_timeout
      expect { subject }.to raise_error RPS::Errors:: GameApiError, "Oops. Curb doesn't want to play."
    end
  end
end
