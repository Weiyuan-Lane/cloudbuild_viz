class CloudbuildViz::CloudbuildStepInitError < StandardError
  def message
    'CloudbuildStep Initialized with improper values'
  end
end
