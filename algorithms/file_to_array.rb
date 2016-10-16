def file_to_array(file)
  integers = File.read(file)
  integers.split.map { |ele| ele.to_i }
end
