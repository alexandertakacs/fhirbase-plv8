norm = require('../../src/fhir/normalize_params')
test = require('../helpers.coffee')

assert = require("assert")

specs = test.loadEdn("#{__dirname}/normalize_params_spec.edn")

describe "Params with meta", ()->
   for spec in specs
     it "et:#{spec.query[1].searchType} pr:#{spec.query[1].prefix} mod:#{spec.query[1].modifier} => #{JSON.stringify(spec.result[1].operator)}", ()->
       #console.log(norm.normalize({params: spec.query}))
       assert.deepEqual(norm.normalize(spec.query), spec.result)

