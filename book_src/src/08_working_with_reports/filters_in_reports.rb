label = project.labels('label.regions.city.name')
puts project.compute_report(left: project.metrics.first,
                            filters: [[label, 'San Francisco', 'Prague']])

# You can also use a variation of NOT equal

label = project.labels('label.regions.city.name')
puts project.compute_report(left: project.metrics.first,
                            filters: [[label, :not, 'San Francisco', 'Prague']])

