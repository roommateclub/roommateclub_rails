namespace :dev do
  task rebuild: ["tmp:clear", "db:drop", "db:create", "db:migrate", "db:seed"]
end