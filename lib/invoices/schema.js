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
    type: 'string'
  },
  status: {
    type: 'string',
    enum: ['DRAFT', 'PUBLISHED']
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

let publishSchema = {
  id: '/invoice',
  type: 'object',
  properties: schemaDefinitions,
  required: [
    'clientId',
    'paymentStatus',
    'dateWritten',
    'referenceNumber',
    'invoiceNumber',
    'details',
    'status'
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
    'clientId',
    'status'
  ],
  additionalProperties: false
}

module.exports = {
  publishSchema,
  draftSchema
}