reports_to_tag = project.reports
                   .select { |report| report.updated > 2.weeks.ago }
                   .select { |report| report.definitions.count > 1 }