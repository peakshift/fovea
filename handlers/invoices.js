'use strict'

let invoices = require('../lib/invoices/index')
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

  invoices
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
  invoices
    .getAll()
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

module.exports = {
  create,
  getAll
}