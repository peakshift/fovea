'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schemas = require('./schema')

const URI = process.env.MONGODB_URI
const DATABASE = process.env.MONGODB_DATABASE
const COLLECTION = process.env.MONGODB_INVOICES_COLLECTION

/**
 * Create Invoice
 *
 * @param {Object} data - fields for creating new invoice
 *
 * @return {Promise}
 */
let create = async (data, status) => {
  let invoice = Object.assign({}, data)
  let validationSchema = {}

  if ( status === 'DRAFT' ) {
    invoice.status = 'DRAFT'
    validationSchema = schemas.draftSchema
  } else {
    invoice.status = 'PUBLISHED'
    validationSchema = schemas.publishSchema
  }

  let validationResult = validateBySchema(invoice, validationSchema)

  if (!validationResult.valid) {
    console.error(JSON.stringify(validationResult.errors))
    throw new Error('Invalid invoice')
  }

  let client = await MongoClient.connect(URI)

  invoice.dateCreated = new Date()
  invoice.dateUpdated = new Date()

  let result = await client
    .db('invoices-service')
    .collection('invoices')
    .insertOne(invoice)

  client.close()

  return result
}

/**
 * Get all Invoices
 *
 * @return {Promise}
 */
let getAll = async () => {
  let mongoClient = await MongoClient.connect(URI)

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .find({})
    .toArray()

  mongoClient.close()

  return result
}

/**
 * Get Invoice by ID
 *
 * @param {String} id
 *
 * @returns {Promise}
 */
let getById = async (id) => {
  let mongoClient = await MongoClient.connect(URI)

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .findOne({ _id: new ObjectID(id) })

  mongoClient.close()

  return result
}

module.exports = {
  create,
  getAll,
  getById
}




































