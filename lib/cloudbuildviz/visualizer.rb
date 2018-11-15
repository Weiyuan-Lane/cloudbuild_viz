class Cloudbuildviz::Visualizer
  def initialize(parsed_cloudbuild_steps)
    @parsed_cloudbuild_steps = parsed_cloudbuild_steps
  end

  def visualize_normal_build(filename)
    g = GraphViz.new( :G, type: :digraph )
    node_hash = Hash.new(nil)
    origin_node = g.add_nodes('Start')

    # Create all nodes
    @parsed_cloudbuild_steps.each do |s|
      node_hash[s.id] = g.add_nodes(s.id)
    end

    # Draw the edges
    @parsed_cloudbuild_steps.each do |s|
      if s.origin_step?
        g.add_edges(origin_node, node_hash[s.id])
      else
        s.prev_ids.each do |prev_id|
          g.add_edges(node_hash[prev_id], node_hash[s.id])
        end
      end
    end
    
    # Generate output image
    g.output( png: filename )
  end
end