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
    #   client.list_policy_holders
    def list_policy_holders(id_number: nil, included_objects: nil)
      includes = case included_objects
      when String, Symbol
        included_objects
      when Array
        included_objects.join(",")
      end

      query = {
        include: includes,
        id_number: id_number
      }.reject { |_, v| v.nil? }

      get(:policyholders, query)
    end

    def get_policy_holder(id:)
      get("policyholders/#{id}")
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
  end
end
