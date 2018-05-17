module RootInsurance::Api
  module PolicyHolder
    def create_policy_holder(id:, first_name:, last_name:, email: nil, date_of_birth: nil, cellphone: nil, app_data: nil)
      raise ArgumentError.new('id needs to be a hash') unless id.is_a? Hash

      data = {
        id:            id,
        first_name:    first_name,
        last_name:     last_name,
        date_of_birth: date_of_birth,
        email:         email,
        cellphone:     cellphone,
        app_data:      app_data
      }.reject { |key, value| value.nil? }

      post(:policyholders, data)
    end

    # List policy holders
    #
    # @param [Hash] id_number An optional ID or passport number to filter by.
    # @param [Array<String, Symbol>, String, Symbol] included_objects An optional list, or single item, of underlying objects to include, e.g. +?include=policies+. Currently, only +policies+ is supported, which will include all policies owned by the policyholder.
    # @return [Array<Hash>]
    #
    # @example
    #   client.list_policy_holders(id_number: "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e", included_objects: :policies)
    def list_policy_holders(id_number: nil, included_objects: nil)
      query = {
        include:   format_included_objects(included_objects),
        id_number: id_number
      }.reject { |_, v| v.nil? }

      get(:policyholders, query)
    end

    # Get a policy holder
    #
    # @param [String] id The unique identifier of the policy holder
    # @param [Array<String, Symbol>, String, Symbol] included_objects An optional list, or single item, of underlying objects to include, e.g. +?include=policies+. Currently, only +policies+ is supported, which will include all policies owned by the policyholder.
    # @return [Hash]
    #
    # @example
    #   client.get_policy_holder(id: "128ba0c0-3f6a-4f8b-9b40-e2066b02b59e", included_objects: :policies)
    #
    def get_policy_holder(id:, included_objects: nil)
      query = {
        include:   format_included_objects(included_objects),
      }.reject { |_, v| v.nil? }

      get("policyholders/#{id}", query)
    end

    def update_policy_holder(id:, email: nil, cellphone: nil, app_data: nil)
      data = {
        email:     email,
        cellphone: cellphone,
        app_data:  app_data
      }.reject { |key, value| value.nil? }

      patch("policyholders/#{id}", data)
    end

    def list_policy_holder_events(id:)
      get("policyholders/#{id}/events")
    end

    private
    def format_included_objects(included_objects)
      case included_objects
      when String, Symbol
        included_objects
      when Array
        included_objects.join(",")
      end
    end
  end
end
