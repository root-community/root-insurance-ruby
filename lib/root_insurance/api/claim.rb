require 'mimemagic'

module RootInsurance::Api
  module Claim
    def list_claims(status: nil, approval: nil)
      query = {
        claim_status:    status,
        approval_status: approval
      }.reject { |key, value| value.nil? }

      get(:claims, query)
    end

    def get_claim(id:)
      get("claims/#{id}")
    end

    def open_claim(policy_id: nil, policy_holder_id: nil)
      data = {
        policy_id:        policy_id,
        policy_holder_id: policy_holder_id
      }.reject { |key, value| value.nil? }

      post(:claims, data)
    end

    def link_policy_to_claim(claim_id:, policy_id:)
      data = {policy_id: policy_id}

      post("claims/#{claim_id}/policy", data)
    end

    def link_policyholder_to_claim(claim_id:, policyholder_id:)
      data = {policyholder_id: policyholder_id}

      post("claims/#{claim_id}/policyholder", data)
    end

    def list_claim_events(id:)
      get("claims/#{id}/events")
    end

    def create_claim_attachment(claim_id:, path: nil, file: nil, description: '')
      data = if path
        claim_attachment_from_path(path)
      elsif file
        claim_attachment_from_file(file)
      else
        {}
      end.merge({description: description})

      post("claims/#{claim_id}/attachments", data)
    end

    private
    def claim_attachment_from_path(path)
      encoded_data = Base64.encode64(File.binread(path))
      file_name = File.basename(path)

      {
        file_base64: encoded_data,
        file_name:   file_name,
        file_type:   MimeMagic.by_magic(File.open(path)).type
      }
    end

    def claim_attachment_from_file(file)
      encoded_data = Base64.encode64(file.read)

      {
        file_base64: encoded_data,
        file_name:   File.basename(file.path),
        file_type:   MimeMagic.by_magic(file).type
      }
    end

  end
end
