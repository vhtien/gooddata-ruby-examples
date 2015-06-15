# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    bp = project.blueprint
    anchors = bp.datasets.map {|d| [d, d.anchor]}
    ids = anchors.map do |d, a|
      a.nil? ? GoodData::Model.identifier_for(d.to_hash, type: :anchor_no_label) : GoodData::Model.identifier_for(d.to_hash, a)
    end
    attributes = ids.pmap {|id| project.attributes(id)}
    puts project.compute_report(left: attributes.map(&:create_metric))
  end
end
