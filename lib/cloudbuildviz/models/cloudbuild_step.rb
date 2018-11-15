
module Cloudbuildviz::Models
  class CloudbuildStep
    attr_reader :id, :prev_ids

    def initialize(id: nil, prev_ids: [])
      if id == nil
        raise Cloudbuildviz::CloudbuildStepInitError.new
      end

      @id = id
      @prev_ids = prev_ids
    end

    def origin_step?
      @prev_ids.length == 0
    end
  end
end