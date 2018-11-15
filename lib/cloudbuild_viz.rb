require 'cloudbuild_viz/loader'
require 'cloudbuild_viz/visualizer'
require 'ruby-graphviz'

module CloudbuildViz
  def self.make(inputfile, outputfile)
    loader = CloudbuildViz::Loader.new(inputfile)
    parsed_steps = loader.parse_cloudbuild_steps
    visualizer = CloudbuildViz::Visualizer.new(parsed_steps)
    visualizer.visualize_normal_build(outputfile)
  end
end

Dir[File.dirname(__FILE__) + '/**/*.rb'].each {|file| require file }