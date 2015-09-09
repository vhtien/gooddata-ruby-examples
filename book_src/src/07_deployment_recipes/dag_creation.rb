# encoding: utf-8

require 'gooddata'
require 'graphviz'

PROJECT_ID = 'sp4vmjei1hh22cjw4u78ans9c7i8apqi' # fill_in

GoodData.with_connection do |client|
  GoodData.with_project(PROJECT_ID) do |project|
    schedules = project.schedules

    nodes = project.processes.pmapcat { |p| p.schedules.map { |s| [s, "#{p.name}-#{s.name}"] } }
    edges = schedules.reject(&:time_based?).pmap {|s| ["#{s.after.process.name}-#{s.after.name}", "#{s.process.name}-#{s.name}"]}


    g = GraphViz.new(:G, :type => :digraph , :rankdir => 'TB')
    nodes.each { |s, n|
      node = g.add_nodes(n)
      node[:shape] = 'box'
      node[:label] = n + "\n#{s.cron}"
    }

    edges.each { |a, b| g.add_edges(a, b) }
    g.output(:png => "run_dag.png")

    # Now you can open it for example on mac by running this on terminal
    # open -a Preview run_dag.png
  end
end