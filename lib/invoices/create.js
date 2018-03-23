'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schema = require('./schema')

const DATABASE = process.env.MONGODB_DATABASE
const COLLECTION = process.env.MONGODB_INVOICES_COLLECTION

/**
 * Create Invoice
 *
 * @param {Object} data - fields for creating new invoice
 *
 * @return {Promise}
 */
let create = async (data) => {
  let invoice = Object.assign({}, data)

  let validationResult = validateBySchema(invoice, schema)

  if (!validationResult.valid) {
    console.error(JSON.stringify(validationResult.errors))
    throw new Error('Invalid invoice')
  }

  let client = await MongoClient.connect(process.env.MONGODB_URI)

  invoice.dateCreated = new Date()
  invoice.dateUpdated = new Date()

  let result = await client
    .db('invoices-service')
    .collection('invoices')
    .insertOne(invoice)

  client.close()

  return result
}

module.exports = {
  create
}



































