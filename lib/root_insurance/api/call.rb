module RootInsurance::Api
  module Call
    def list_calls
      get(:calls)
    end

    def get_call(id:)
      get("calls/#{id}")
    end

    def list_call_events(id:)
      get("calls/#{id}/events")
    end
  end
end
