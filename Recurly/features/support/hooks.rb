Before do
  $br = Watir::Browser.new :chrome
  $br.window.maximize
end

After do
  $br.close
end
