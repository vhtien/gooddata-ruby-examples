# encoding: utf-8

require 'gooddata'

BLUEPRINT_FILE = 'blueprint_file.json'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    blueprint = GoodData::Model::ProjectBlueprint.from_json(BLUEPRINT_FILE)
    update = GoodData::Model::ProjectBlueprint.build('update') do |p|
      p.add_dataset('repos') do |d|
        d.add_attribute('region')
      end
    end
    new_blueprint = blueprint.merge(update)
    unless new_blueprint.valid?
	    pp new_blueprint.validate
	    fail "New blueprint is not valid"
    end
    project.update_from_blueprint(new_blueprint)
    new_blueprint.store_to_file(BLUEPRINT_FILE))
  end
end
