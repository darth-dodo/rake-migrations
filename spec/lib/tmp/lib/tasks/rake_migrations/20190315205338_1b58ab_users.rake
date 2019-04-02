# Checklist:
# 1. Re-runnable on production?
# 2. Is there a chance emails will be sent?
# 3. puts ids & logs (progress log)
# 4. Should this be inside a Active Record Transaction block?
# 5. Are there any callbacks?
# 6. Performance issues?

namespace :users do
  desc "TODO"
  task do_something: [:environment] do


    # DO NOT REMOVE THIS PART. MARKS THE RAKE AS COMPLETE IN THE DATABASE
    RakeMigration.mark_complete(__FILE__)
  end
end
