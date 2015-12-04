# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
    p.add_date_dimension('committed_on')
    p.add_date_dimension('signed_on')

    p.add_dataset('dataset.commits') do |d|
      d.add_anchor('attr.commits.id')
      d.add_fact('fact.commits.lines_changed')
  	  d.add_attribute('attr.commits.name')
      d.add_label('label.commits.name', reference: 'attr.commits.name')
      d.add_date('committed_on', :format => 'dd/MM/yyyy')
    end
  end

  # Let's check that there are some references really pointing to committed_on dimension
  # and none to signed_on dimension

  blueprint.datasets.flat_map(&:references).map(&:reference).include?('committed_on')
  # => true
  blueprint.datasets.flat_map(&:references).map(&:reference).include?('signed_on')
  # => false

  # let's swap all the references
  blueprint.swap_date_dimension!('committed_on', 'signed_on')

  # Now if we check we see that there is no reference to committed_on dimension
  blueprint.datasets.flat_map(&:references).map(&:reference).include?('committed_on')
  # => false
  blueprint.datasets.flat_map(&:references).map(&:reference).include?('signed_on')
  # => true
end
