reports_to_tag = project.reports
                   .select { |reports| report.updated_at > 2.weeks.ago }
                   .select { |report| report.revisions.count > 1 }