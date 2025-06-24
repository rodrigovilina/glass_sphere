SimpleCov.start do
  add_filter "/spec/"

  enable_coverage :branch
  primary_coverage :branch

  minimum_coverage line: 70, branch: 70
  minimum_coverage_by_file 70
end
