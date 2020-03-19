'use strict'

let clients = require('../lib/clients/index')
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

  clients
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
  clients
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

  clients
    .getById(id)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))
}

module.exports = {
  create,
  getAll,
  getById
}