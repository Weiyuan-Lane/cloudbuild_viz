require 'ruby-graphviz'

module Cloudbuildviz
  def self.make(inputfile, outputfile)
    loader = Cloudbuildviz::Loader.new(inputfile)
    parsed_steps = loader.parse_cloudbuild_steps
    visualizer = Cloudbuildviz::Visualizer.new(parsed_steps)
    visualizer.visualize_normal_build(outputfile)
  end
end

Dir[File.dirname(__FILE__) + '/**/*.rb'].each {|file| require file }