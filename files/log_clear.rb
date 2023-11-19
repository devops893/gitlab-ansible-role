artifacts_deleted = 0
::Ci::JobArtifact.find_each do |artifact|                      ### Iterate artifacts
  #next if artifact.file.filename != "job.log"                 ### Uncomment if only `job.log` files' references are to be processed
  next if artifact.file.file.exists?                           ### Skip if the file reference is valid
  artifacts_deleted += 1
  puts "#{artifact.id}  #{artifact.file.path} is missing."     ### Allow verification before destroy
  artifact.destroy!                                           ### Uncomment to actually destroy
end
puts "Count of identified/destroyed invalid references: #{artifacts_deleted}"
