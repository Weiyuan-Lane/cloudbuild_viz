require 'yaml'

class Cloudbuildviz::Loader
  ORIGIN_ID = '-'.freeze

  def initialize(filename = '')
    if filename.class != String
      raise Cloudbuildviz::LoaderInitError.new('invalid filename')
    end

    cloudbuild = YAML::load_file(filename)
    if !cloudbuild.key?('steps') or cloudbuild['steps'].size == 0
      raise Cloudbuildviz::LoaderInitError.new('cloudbuild missing valid \'steps\' key at root')
    end

    @cloudbuild_steps = cloudbuild['steps']
    
  end

  def parse_cloudbuild_steps
    parsed_ids = []
    @cloudbuild_steps.map do |s| 
      result = if implicit_next_step?(s)
                  Cloudbuildviz::Models::CloudbuildStep.new(id: s['id'], prev_ids: parsed_ids.dup)
                elsif origin_step?(s)
                  Cloudbuildviz::Models::CloudbuildStep.new(id: s['id'])
                else
                  Cloudbuildviz::Models::CloudbuildStep.new(id: s['id'], prev_ids: s['waitFor'])
                end
      
      parsed_ids << s['id']
      result
    end
  end

  private
  def origin_step?(cloudbuild_step)
    cloudbuild_step['waitFor'].size == 1 && 
    cloudbuild_step['waitFor'][0].strip == ORIGIN_ID
  end

  def implicit_next_step?(cloudbuild_step)
    !cloudbuild_step.key?('waitFor') ||
    cloudbuild_step['waitFor'].size == 0
  end
end
