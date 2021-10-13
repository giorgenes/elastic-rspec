  RSpec::Matchers.define :find_object do |expected|
    match do |actual|
      hits = actual["hits"]


      if hits['hits'].size > 0
        hits['hits'].find { |hit| hit['_id'].to_s == expected.to_s } != nil
      end
    end
  end
  