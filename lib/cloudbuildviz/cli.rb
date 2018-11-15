require 'thor'

class Cloudbuildviz::CLI < Thor
  desc "make", "input and output"
  options input: :string, output: :string
  def make(input = '', output = '')
    Cloudbuildviz.make(input, output)
  end
end