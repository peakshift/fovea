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
  let query = event.queryStringParameters
  let status = (query !== null && query.hasOwnProperty('status')) ? query.status : null

  invoices
    .create(data, status)
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

/**
 * Get by ID handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */
let getById = (event, context, callback) => {
  let { id } = event.pathParameters

  invoices
    .getById(id)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

module.exports = {
  create,
  getAll,
  getById
}