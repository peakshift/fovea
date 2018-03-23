'use strict'

let payments = require('../lib/payments/index')
let { successHandler } = require('./shared')

/**
 * Create handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */

let create = (event, context, callback) => {
  let data = JSON.parse(event.body)

  payments
    .create(data)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))

}

/**
 * Get All handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */
let getAll = (event, context, callback) => {
  payments
    .getAll()
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

module.exports = {
  create,
  getAll
}