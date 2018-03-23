'use strict'

/**
 * Invoice Schema Property Definitions
 *
 * @type {Object}
 */

let schemaDefinitions = {
  clientId: {
    type: 'string'
  },
  paymentStatus: {
    type: 'integer',
    enum: [0, 1]
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
            }
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
}

/**
 * Invoice Schema
 *
 * @type {Object}
 */

let schema = {
  id: '/invoice',
  type: 'object',
  properties: schemaDefinitions,
  required: [
    'clientId',
    'paymentStatus',
    'dateWritten',
    'referenceNumber',
    'invoiceNumber',
    'details'
  ],
  additionalProperties: false
}

/**
 * Draft Invoice Schema
 *
 * @type {Object}
 */

let draftSchema = {
  id: '/invoice-draft',
  type: 'object',
  properties: schemaDefinitions,
  required: [
    'clientId'
  ],
  additionalProperties: false
}

module.exports = {
  schema,
  draftSchema
}