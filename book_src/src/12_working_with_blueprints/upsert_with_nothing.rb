blueprint = GoodData::Model::ProjectBlueprint.build('Measurements project') do |p|
  p.add_date_dimension('measured_on')
  p.add_dataset('dataset.measurements') do |d|
    d.add_anchor('attr.measurement')
    d.add_attribute('attr.river')
    d.add_label('label.river_name', :reference => 'attr.river')
    d.add_fact('fact.level')
    d.add_date('measured_on')
  end
end

project = GoodData::Project.create_from_blueprint(blueprint, auth_token: 'octocat')

# and upload these data

data = [
  ['measured_on','label.river_name','fact.level'],
  ['1/1/2011', 'Colorado River', 10],
  ['1/1/2011', 'Amazon River', 20],
  ['1/2/2011', 'Colorado River', 20],
  ['1/2/2011', 'Amazon River', 30]
]

project.upload(data, blueprint, 'dataset.measurements')

# You can easily verify that there are 4 lines.

  blueprint.datasets('dataset.measurements').count(project)
=> 4

# Now let's upload additional rows. Take note that the first one is the same as line x from the first batch

data = [
  ['measured_on','label.river_name','fact.level'],
  ['1/1/2011', 'Colorado River', 10],
  ['1/3/2011', 'Amazon River', 40]
]

project.upload(data, blueprint, 'dataset.measurements', :mode => 'INCREMENTAL')

# If you recount the lines there are now 6 lines.

blueprint.datasets('dataset.measurements').count(project)
=> 6