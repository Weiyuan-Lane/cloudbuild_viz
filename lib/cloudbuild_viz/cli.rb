require 'thor'

class CloudbuildViz::CLI < Thor
  desc "make", "input and output"
  options input: :string, output: :string
  def make(input = '', output = '')
    CloudbuildViz.make(input, output)
  end
end