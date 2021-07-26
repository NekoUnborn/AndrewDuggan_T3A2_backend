namespace :reset_checklist_entries do
  desc "TODO"
  task reset: :environment do
    ChecklistEntry.all.each do |entry|
      entry.update(complete: false)
    end
  end

end
