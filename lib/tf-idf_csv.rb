require 'csv'

# This class expects a CSV input
# One row per document, 
# the first cell should be a document identifier
# each subsequent cell contains one term. 
# TF-IDF will be returned based on the number of times the term appears in each document, relative to the total number of documents it appears in
class Tf_Idf_CSV

  def initialize      
    @tf_idf = {}
    @total_number_of_docs = 0 
    @doc_count_per_term = Hash.new(0)
    @term_freq_per_doc = Hash.new  
  end

  def add_csv(csv)
    csv.each do |row|
      name = row[0] 
      terms = row[1..-1]
      add_document(name, terms)
    end
    calculate_tf_idf
  end

  # Save the results as CSV
  # Term, Doc1, Doc2, Doc3...
  # Eggs, 0.04535,,0.02
  def write(csv_file_name, options = {})
    decimal_places = options[:decimal_places] || 20
        
    CSV.open(csv_file_name,"w") do |f|
      f << ["term", docs].flatten
      @tf_idf.each do |term, values|
        tmp_row = [term]
        docs.each do |doc|
          value = values[doc] ? ("%.#{decimal_places}f" % values[doc]) : nil
          value = nil if value =~ /^0\.0+$/
          tmp_row << value
        end
        f << tmp_row
      end
    end
  end

  private

  def add_document(doc, terms)
    @total_number_of_docs += 1
    
    term_counts_doc = Hash.new(0.0)

    # Count the number of times each term appears in this document
    terms.each do |term|
      term_counts_doc[term] += 1.0    
    end

    # Normalize the count to find term frequency. Divide count by total number of terms in document
    term_counts_doc.each_key do |term|
      term_counts_doc[term] /= terms.size
      @doc_count_per_term[term] += 1.0
    end
    
    @term_freq_per_doc[doc] = term_counts_doc    
  end
  
  def docs
    @term_freq_per_doc.keys
  end

  # produces a hash indexed by term, with each value being a hash indexed by document with a value being the TF-IDF
  # { "cat" => { "Green Eggs and Ham" => 0.04535, "Dick Wittington" => 0.02343434 }, "Eggs" => { "Green Eggs and Ham" => 0.02764} } }
  def calculate_tf_idf  
    @doc_count_per_term.each do |term, count_per_doc|
      doc_list = {}
      docs.each do |doc|
        # if we have a frequency for this term, we can calculate TF-IDF
        if @term_freq_per_doc[doc].key?(term)
          doc_list[doc] = @term_freq_per_doc[doc][term] * Math.log10(@total_number_of_docs / count_per_doc) 
        else
          doc_list[doc] = nil
        end
      end
      @tf_idf[term] = doc_list    
    end
  end

end

