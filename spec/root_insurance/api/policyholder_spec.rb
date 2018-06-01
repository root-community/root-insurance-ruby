describe RootInsurance::Api::Policyholder do
  let(:base_url) { "https://sandbox.root.co.za/v1/insurance" }
  let(:url) { "#{base_url}/policyholders" }

  let(:app_id)      { 'app_id' }
  let(:app_secret)  { 'app_secret' }
  let(:environment) { :sandbox }

  let(:client) { RootInsurance::Client.new(app_id, app_secret, environment) }

  let(:policyholder_id) { "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e" }

  describe :create_policyholder do
    let(:id_obj) { {type: 'id', number: '6801015800084', country: 'ZA'} }
    let(:first_name) { "Erlich" }
    let(:last_name)  { "Bachman" }
    let(:email)      { "erlich@root.co.za" }

    let(:expected_body) do
      {
        id:         id_obj,
        first_name: first_name,
        last_name:  last_name,
        email:      email
      }
    end

    it "posts to the correct url" do
      stub_request(:post, url)
        .with(body: expected_body)
        .to_return(body: "{}")

      client.create_policyholder(
        id:         id_obj,
        first_name: first_name,
        last_name:  last_name,
        email:      email)
    end
  end

  describe :list_policyholders do
    it "gets from the correct url" do
      stub_request(:get, url)
        .to_return(body: "{}")

      client.list_policyholders
    end

    context "when supplying an id number" do
      let(:id_number) { "6801015800084" }

      it "includes the correct query string" do
        stub_request(:get, url)
          .with(query: {id_number: id_number})
          .to_return(body: "{}")

        client.list_policyholders(id_number: id_number)
      end
    end

    context "when supplying a single object to include" do
      let(:includes) { "policies" }

      it "includes the correct query string" do
        stub_request(:get, url)
          .with(query: {include: includes})
          .to_return(body: "{}")

        client.list_policyholders(included_objects: includes)
      end
    end

    context "when supplying a list of objects to include" do
      let(:includes) { ["a", "b", "c"] }

      it "includes the correct query string" do
        stub_request(:get, url)
          .with(query: {include: includes.join(",")})
          .to_return(body: "{}")

        client.list_policyholders(included_objects: includes)
      end
    end
  end

  describe :get_policyholder do
    let(:get_url) { "#{url}/#{policyholder_id}" }

    it "gets from the correct url" do
      stub_request(:get, get_url)
        .to_return(body: "{}")

      client.get_policyholder(id: policyholder_id)
    end

    context "when supplying a single object to include" do
      let(:includes) { "policies" }

      it "includes the correct query string" do
        stub_request(:get, get_url)
          .with(query: {include: includes})
          .to_return(body: "{}")

        client.get_policyholder(id: policyholder_id, included_objects: includes)
      end
    end

    context "when supplying a list of objects to include" do
      let(:includes) { ["a", "b", "c"] }

      it "includes the correct query string" do
        stub_request(:get, get_url)
          .with(query: {include: includes.join(",")})
          .to_return(body: "{}")

        client.get_policyholder(id: policyholder_id, included_objects: includes)
      end
    end
  end

  describe :update_policyholder do
    let(:policyholder_url) { "#{url}/#{policyholder_id}" }
    let(:email)     { "erlich@piedpiper.com" }
    let(:cellphone) { "+27741011337" }

    context "given an email address" do
      it "patches the correct url with the email address" do
        stub_request(:patch, policyholder_url)
          .with(body: {email: email})
          .to_return(body: "{}")

        client.update_policyholder(
          id:    policyholder_id,
          email: email)
      end
    end

    context "given a cellphone number" do
      it "patches the correct url with the cellphone number" do
        stub_request(:patch, policyholder_url)
          .with(body: {cellphone: cellphone})
          .to_return(body: "{}")

        client.update_policyholder(
          id:        policyholder_id,
          cellphone: cellphone)
      end
    end
  end

  describe :list_policyholder_events do
    let(:events_url) { "#{url}/#{policyholder_id}/events" }

    it "gets from the correct url" do
      stub_request(:get, events_url)
        .to_return(body: "{}")

      client.list_policyholder_events(id: policyholder_id)
    end
  end

end
