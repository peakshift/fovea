'use strict'

/**
 * Success Handler
 *
 * @param {*} result
 * @param {function} callback
 */
let successHandler = (result, callback) => {
  let response = {
    statusCode: 200,
    body: JSON.stringify({
      result,
      env: process.env.NODE_ENV
    })
  }

  callback(null, response)
}

module.exports = {
  successHandler
}