require 'json'

def merge_json_files(file1_path, file2_path)
  begin
    # Read JSON files
    file1_content = File.exist?(file1_path) ? File.read(file1_path) : '[]'
    file2_content = File.exist?(file2_path) ? File.read(file2_path) : '[]'

    # Parse JSON contents
    json1 = JSON.parse(file1_content)
    json2 = JSON.parse(file2_content)

    # Ensure both contents are arrays
    unless json1.is_a?(Array) && json2.is_a?(Array)
      raise "JSON files must contain arrays to be merged."
    end

    # Merge the two arrays
    merged_json = json2 + json1

    # Write the result back to file2_path
    File.write(file2_path, JSON.pretty_generate(merged_json))
    puts "Merged JSON written to #{file2_path}"

  rescue Errno::ENOENT
    puts "Error: One of the files is missing."
  rescue JSON::ParserError
    puts "Error: One of the files contains invalid JSON."
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end
