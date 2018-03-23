'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schema = require('./schema')

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

  let mongoClient = await MongoClient.connect(process.env.MONGODB_URI)

  payment.dateCreated = new Date()
  payment.dateUpdated = new Date()

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .insertOne(payment)

  mongoClient.close()

  return result
}

module.exports = {
  create
}




































