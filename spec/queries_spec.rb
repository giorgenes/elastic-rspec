require 'spec_helper'

describe 'search API', :vcr do
	subject(:client) { Elasticsearch::Client.new log: ENV['ELASTIC_LOG']==1 }

	describe '#search' do
		let(:index_name) { 'test_index' }
		subject { client.search body: query.to_hash }

		before do
			client.indices.delete index: index_name, ignore: 404

			client.indices.create(index: index_name)

			response = client.indices.put_mapping(
				index: index_name,
				body: {
					properties: {
						name: {
							type: 'text'
						},
            lang: {
              type: 'keyword'
            }
					}
				}
			)
		end

		context 'searching missing fields', focus: true do
			before do
        client.index(
            index: index_name,
            refresh: 'wait_for',
            id: 1,
            body: {
              name: 'Giorgenes Gelatti'
            }
          )
      end

      let(:query) do
        search do
          query do
            bool do
              must_not do
                exists field: 'lang'
              end
            end
          end
        end
      end

      it { is_expected.to find_object(1) }
		end
	end
end