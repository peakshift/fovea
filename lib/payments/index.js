'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schema = require('./schema')

const URI = process.env.MONGODB_URI
const DATABASE = process.env.MONGODB_DATABASE
const COLLECTION = process.env.MONGODB_PAYMENTS_COLLECTION

/**
 * Create Payment
 *
 * @param {Object} data - fields for creating new payment
 *
 * @return {Promise}
 */
let create = async (data) => {
  let payment = Object.assign({}, data)

  let validationResult = validateBySchema(payment, schema)

  if (!validationResult.valid) {
    console.error(JSON.stringify(validationResult.errors))
    throw new Error('Invalid payment')
  }

  let mongoClient = await MongoClient.connect(URI)

  payment.dateCreated = new Date()
  payment.dateUpdated = new Date()

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .insertOne(payment)

  mongoClient.close()

  return result
}

/**
 * Get all Payments
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
 * Find Payment by ID
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




































