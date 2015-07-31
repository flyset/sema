# Classifications /pronoun|conjunctions|interjections|articles|preposition/
mongoimport --db sema --collection basic_words --file conjunction_classifications.json
mongoimport --db sema --collection basic_words --file pronoun_classifications.json
mongoimport --db sema --collection basic_words --file article_classifications.json
# mongoimport --db sema --collection basic_words --file interjection_classifications.json
mongoimport --db sema --collection basic_words --file preposition_classifications.json
mongoimport --db sema --collection basic_words --file acronym_classifications.json

# Generate stemmed data
ruby create_stemmed_json.rb verbs.txt verb > verb_classifications.json
ruby create_stemmed_json.rb adjectives.txt adjective > adjective_classifications.json
ruby create_stemmed_json.rb adverbs.txt adverb > adverb_classifications.json
ruby create_stemmed_json.rb nouns.txt noun > noun_classifications.json

# Stemmed classifications
mongoimport --db sema --collection stemmed_words --file verb_classifications.json
mongoimport --db sema --collection stemmed_words --file adjective_classifications.json
mongoimport --db sema --collection stemmed_words --file adverb_classifications.json
mongoimport --db sema --collection stemmed_words --file noun_classifications.json

# Connect stem words together
ruby connect_stemmed_words.rb