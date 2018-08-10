'use strict'

let payments = require('../lib/payments/index')
let { successHandler } = require('./shared')

/**
 * Get Payments handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */
let get = (event, context, callback) => {
  let { id } = event.pathParameters

  payments
    .get(id)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

/**
 * Get Single Invoice Payment handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */
let getSingle = (event, context, callback) => {
  let { id, transactionId } = event.pathParameters

  payments
    .getSingle(id, transactionId)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

/**
 * Create handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */

let create = (event, context, callback) => {
  let { id } = event.pathParameters
  let data = JSON.parse(event.body)

  payments
    .create(id, data)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))

}

module.exports = {
  create,
  get,
  getSingle
}