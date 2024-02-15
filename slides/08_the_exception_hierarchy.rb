# Let's generate a graph of the exception hierarchy
# See also: https://www.exceptionalcreatures.com/bestiary.html

# require "net/http"

puts "digraph {"
puts "layout = twopi"
puts "overlap = false"

# https://tailwindcss.com/docs/customizing-colors
# Lime 50-400
COLORS = %w[
  #a3e635
  #bef264
  #d9f99d
  #ecfccb
  #f7fee7
]

ObjectSpace.each_object(Class) do |klass|
  next unless klass <= Exception

  next if klass < SystemCallError || klass < Gem::Exception || klass < Gem::LoadError || klass < Ractor::Error

  ancestors = klass.ancestors.filter do |ancestor|
    ancestor <= Exception
  end

  root = klass == Exception ? "true" : "false"
  color = COLORS[ancestors.size - 1] || "white"
  puts "\"#{klass.name}\" [shape = box, root = #{root}, style = filled, color = \"#{color}\"]"

  next if ancestors.size < 2

  child, parent = ancestors.take(2)
  puts "\"#{parent.name}\" -> \"#{child.name}\""
end

puts "}"

# ruby 08_the_exception_hierarchy.rb | dot -Tsvg > output.svg && open output.svg -a Firefox
