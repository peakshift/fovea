'use strict'

let clients = require('../lib/clients/create')
let { successHandler } = require('./shared')

/**
 * Create handler
 *
 * @param {Object} event
 * @param {Object} context
 * @param {Function} callback
 */

let create = (event, context, callback) => {
  console.log(event)
  let data = JSON.parse(event.body)
  console.log('this is the return data')
  console.log(data);
  clients
    .create(data)
    .then((result) => successHandler(result, callback))
    .catch((err) => callback(err))

}

module.exports = {
  create
}