'use strict'

/**
 * Invoice Schema
 *
 * @type {Object}
 */

let schema = {
  id: '/invoice',
  type: 'object',
  properties: {
    status: {
      type: 'integer',
      enum: [0, 1]
    },
    clientId: {
      type: 'string'
    },
    dateWritten: {
      type: 'string',
      format: 'date-time'
    },
    referenceNumber: {
      type: 'string'
    },
    invoiceNumber: {
      type: 'number'
    },
    details: {
      type: 'array',
      minItems: 1,
      items: {
        type: 'object',
        properties: {
          label: {
            type: 'string',
            enum: [ 'SERVICE', 'PRODUCT' ]
          },
          description: {
            type: 'object',
            properties: {
              title: {
                type: 'string'
              },
              text: {
                type: 'string'
              },
              list: {
                type: 'array',
                items: {
                  'type': 'string'
                }
              },
            }
          },
          quantity: {
            type: 'number'
          },
          total: {
            type: 'number'
          }
        },
        required: [
          'label',
          'description',
          'quantity',
          'total'
        ]
      }
    },
    notes: {
      type:  'string'
    }
  },
  required: [
    'clientId',
    'dateWritten',
    'referenceNumber',
    'invoiceNumber',
    'details'
  ],
  additionalProperties: false
}

module.exports = schema