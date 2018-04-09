'use strict'

/**
 * Payment Schema
 *
 * @type {Object}
 */

let schema = {
  id: '/payment',
  type: 'object',
  properties: {
    transactionId: {
      type: 'string'
    },
    amount: {
      type: 'number'
    }
  },
  required: [
    'transactionId',
    'amount'
  ],
  additionalProperties: false
}

module.exports = schema