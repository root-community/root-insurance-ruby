module RootInsurance::Api
  module Application

    # Create an application
    #
    # @param [String] policyholder_id The policy holder id
    # @param [String] quote_package_id The quote package id
    # @param [Integer] monthly_premium The monthly premium (in cents)
    # @param [String] serial_number The device to insure's serial number. (for the gadgets module)
    # @param [String] spouse_id SA ID number of the policyholder's spouse. Required if has_spouse is true on the quote.
    # @param [Array<String>] children_ids SA ID numbers of the policyholder's children. Required if number_of_children is greater than 0 on the quote. All children must be younger than 21.
    # @param [Array<String>] SA ID number of the policyholder's extended family members. Required if the length of +extended_family_ages+ is greater than 0 on the quote. The ages inferred from the ID numbers must match the ages given in the quote step.
    # @return [Hash]
    def create_application(policyholder_id:, quote_package_id:, monthly_premium:,
                           serial_number: nil, spouse_id: nil, children_ids: nil, extended_famliy_ids: nil)
      data = {
        policyholder_id:  policyholder_id,
        quote_package_id: quote_package_id,
        monthly_premium:  monthly_premium
      }

      module_data = if serial_number
        {serial_number: serial_number}
      elsif spouse_id || children_ids || extended_famliy_ids
        {
          spouse_id:           spouse_id,
          children_ids:        children_ids,
          extended_famliy_ids: extended_famliy_ids
        }.reject { |key, value| value.nil? }
      end

      data = module_data ? data.merge(module_data) : data

      post(:applications, data)
    end
  end
end
