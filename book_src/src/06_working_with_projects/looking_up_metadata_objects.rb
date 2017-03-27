options = { project: project, client: client }
id = metric.obj_id
# => "2258"
GoodData::MdObject[id, options].class
# => GoodData::Metric

identifier = metric.identifier
# => "metric.total.claim.amount"
GoodData::MdObject[identifier, options].class
# => GoodData::Metric

uri = metric.uri
# => "/gdc/md/zlf5mgyd1txaztohukv8xwv1jjm28zvg/obj/2258"
GoodData::MdObject[uri, options].class
# => GoodData::Metric
