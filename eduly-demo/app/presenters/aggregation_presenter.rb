class AggregationPresenter < Struct.new(:aggregation)
	def designation_title
		aggregation.first.split('_').first.pluralize.titleize
	end

	def buckets
		aggregation[1].id_and_designation_title.buckets.map{ |b| BucketPresenter.new(b) }
	end
end
