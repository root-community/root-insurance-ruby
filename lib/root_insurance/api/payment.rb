module RootInsurance::Api
  module Payment
    def create_payment_method(policy_holder_id:, type: 'debit_order', bank_details: {}, policy_ids: nil)
      validate_bank_details(bank_details)

      data = {
        type:         type,
        bank_details: bank_details
      }

      if policy_ids && policy_ids.is_a?(Array)
        data.merge!(policy_ids: policy_ids)
      elsif policy_ids && policy_ids.is_a?(String)
        data.merge!(policy_ids: [policy_ids])
      end

      post("policyholders/#{policy_holder_id}/payment-methods", data)
    end

    def link_payment_method(policy_id:, payment_method_id:)
      data = {payment_method_id: payment_method_id}

      put("policies/#{policy_id}/payment-method", data)
    end

    private
    def validate_bank_details(bank_details)
      [:first_name, :last_name, :bank, :branch_code, :account_number].each do |key|
        if !(bank_details[key] || bank_details[key.to_sym])
         raise ArgumentError.new("Bank details need to include #{key}")
        end
      end
    end
  end
end
