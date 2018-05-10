describe RootInsurance::Api::Call do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/calls" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { RootInsurance::Client.new(app_id, app_secret, environment) }

  let(:call_id) { "0ac6dffb-bd15-4829-b96d-e2c1abe61d3a" }

  describe :list_calls do
    it "gets from the correct url" do
      stub_request(:get, url)
        .to_return(body: "{}")

      client.list_calls
    end
  end

  describe :get_call do
    it "gets from the correct url" do
      call_url = "#{url}/#{call_id}"
      stub_request(:get, call_url)
        .to_return(body: "{}")

      client.get_call(id: call_id)
    end
  end

  describe :get_call_events do
    let(:get_url) { "#{url}/#{call_id}/events" }
    it "gets from the correct url" do
      stub_request(:get, get_url)
        .to_return(body: "{}")

      client.list_call_events(id: call_id)
    end
  end
end
