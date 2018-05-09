'use strict'

/**
 * Projects Schema
 *
 * @type {Object}
 */

let schema = {
  id: '/projects',
  type: 'object',
  properties: {
    name: {
      type: 'string'
    },
    ID: {
      type: 'string'
    },
    status: {
      type: 'integer',
      enum: [0, 1]
    },
    description: {
      type: 'string'
    },
    hours: {
      type: 'number'
    },
    client: {
      type: 'string'
    }
  },
  required: [
    'name',
    'ID',
    'status',
    'hours'
    'client'
  ],
  additionalProperties: false
}

module.exports = schema