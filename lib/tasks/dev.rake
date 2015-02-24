namespace :dev do
  task rebuild: ["tmp:clear", "db:drop", "db:create", "db:migrate"] # add "db:seed"
end