class Cloudbuildviz::LoaderInitError < StandardError
  def initialize(reason = '')
    @reason = reason
  end

  def message
    "Loader initialisation failed because of: #{@reason}"
  end
end
