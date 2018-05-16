describe RootInsurance::Api::Payment do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { RootInsurance::Client.new(app_id, app_secret, environment) }

  let(:policy_holder_id) { "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e" }

  let(:bank_details) do
    {
      first_name:     "Erlich",
      last_name:      "Bachman",
      bank:           "absa",
      branch_code:    "12345",
      account_number: "123456789"
    }
  end

  describe :create_payment_method do
    let(:url) { "#{base_url}/policyholders/#{policy_holder_id}/payment-methods" }
    let(:expected_data) do
      {
        type: 'debit_order',
        bank_details: bank_details
      }
    end

    it "posts to the correct url" do
      stub_request(:post, url)
        .to_return(body: "{}")

      client.create_payment_method(
        policy_holder_id: policy_holder_id,
        bank_details:     bank_details)
    end

    it "posts the correct data" do
      stub_request(:post, url)
        .with(body: expected_data)
        .to_return(body: "{}")

      client.create_payment_method(
        policy_holder_id: policy_holder_id,
        bank_details:     bank_details)
    end

    context "with incomplete bank details" do
      it "raises an error" do
        stub_request(:post, url)
          .to_return(body: "{}")

        random_key = bank_details.keys.sample

        expect do
          client.create_payment_method(
            policy_holder_id: policy_holder_id,
            bank_details:     bank_details.dup.tap { |h| h.delete(random_key) })
        end.to raise_exception(ArgumentError, "Bank details need to include #{random_key}")

      end
    end

    context "provided with a policy id" do
      let(:policy_id) { "9e0c897f-bc68-4225-b13a-57599062ea0a" }
      it "posts the correct data" do
        stub_request(:post, url)
          .with(body: expected_data.merge(policy_ids: [policy_id]))
          .to_return(body: "{}")

        client.create_payment_method(
          policy_holder_id: policy_holder_id,
          bank_details:     bank_details,
          policy_ids:       policy_id)

      end
    end

    context "provided with a list of policy ids" do
      let(:policy_id) { "9e0c897f-bc68-4225-b13a-57599062ea0a" }
      it "posts the correct data" do
        stub_request(:post, url)
          .with(body: expected_data.merge(policy_ids: [policy_id]))
          .to_return(body: "{}")

        client.create_payment_method(
          policy_holder_id: policy_holder_id,
          bank_details:     bank_details,
          policy_ids:       [policy_id])

      end
    end
  end

  describe :link_payment_method do
    let(:url) { "#{base_url}/policies/#{policy_id}/payment-method" }
    let(:policy_id) { "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e" }
    let(:payment_method_id) { "e0b7b222-772f-47ac-b08d-c7ba38aa1b25" }

    it "puts to the correct url" do
      stub_request(:put, url)
        .to_return(body: "{}")

      client.link_payment_method(
        policy_id:         policy_id,
        payment_method_id: payment_method_id)
    end

    it "puts the correct data" do
      stub_request(:put, url)
        .with({body: {payment_method_id: payment_method_id}})
        .to_return(body: "{}")

      client.link_payment_method(
        policy_id:         policy_id,
        payment_method_id: payment_method_id)
    end
  end
end
