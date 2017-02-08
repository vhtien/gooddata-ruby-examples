# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    colors = [
      { r: 25, g: 36, b: 48 },
      { r: 33, g: 36, b: 64 },
      { r: 42, g: 61, b: 81 }
    ]

    project.create_custom_color_palette(colors)

    # get the current color palette
    current_color_palette = project.current_color_palette.colors

    project.reset_color_palette
  end
end
