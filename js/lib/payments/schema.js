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
    invoiceId: {
      type: 'string'
    },
    transactionId: {
      type: 'string'
    },
    amount: {
      type: 'number'
    }
  },
  required: [
    'transactionId',
    'invoiceId'
  ],
  additionalProperties: false
}

module.exports = schema