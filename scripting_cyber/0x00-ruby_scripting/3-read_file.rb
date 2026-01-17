require 'json'

def count_user_ids(path)
  # Lire le contenu du fichier JSON
  file_content = File.read(path)
  
  # Parser le contenu JSON
  data = JSON.parse(file_content)
  
  # Initialiser un hash pour compter les userId
  user_id_counts = Hash.new(0)
  
  # Parcourir chaque élément et compter les userId
  data.each do |item|
    user_id_counts[item['userId']] += 1
  end

  # Afficher les résultats
  user_id_counts.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end

