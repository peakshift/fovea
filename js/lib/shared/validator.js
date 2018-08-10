'use strict'

let { Validator } = require('jsonschema')

/**
 * Validate by Schema
 *
 * @param {Object} data
 * @param {Object} schema
 *
 * @returns {ValidatorResult}
 */
let validateBySchema = (data, schema) => {
  let v = new Validator()
  return v.validate(data, schema)
}

module.exports = {
  validateBySchema
}