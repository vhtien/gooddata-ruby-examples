var = project.variables('my_variable_identifier')
puts project.compute_report(left: project.metrics.first,
                            filters: [var])
