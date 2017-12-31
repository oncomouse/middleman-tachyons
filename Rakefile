task :build do
  system "bundle exec middleman build"
end

task :serve do
  system "bundle exec middleman"
end

task :deploy do
  system "git add source docs"
  system "git commit -m \"New Slides\""
  system "git push -u"
end
