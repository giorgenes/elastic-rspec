require 'spec_helper'

describe 'cluster commands', :vcr do
	subject(:client) { Elasticsearch::Client.new log: ENV['ELASTIC_LOG']==1 }

	describe '#cluster' do
		subject { client.cluster.health }

		it { is_expected.to include('cluster_name' => 'c1') }
	end
end