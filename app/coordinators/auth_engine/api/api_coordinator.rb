module AuthEngine
  module Api
    class ApiCoordinator < BaseCoordinator

      attr_reader :params, :headers, :current_person, :context

      def initialize(params: {}, headers: {}, current_person: nil, context: {})
        @params = params
        @headers = headers
        @current_person = current_person
        @context = context
      end

      def call
        raise NotImplementedError.new('Implement this!')
      end

      def result
        @result ||= Api::ApiCoordinatorResult.new
      end
    end
  end
end

