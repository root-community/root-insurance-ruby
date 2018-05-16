module RootInsurance::Api
  module Application
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
