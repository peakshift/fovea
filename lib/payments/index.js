'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schema = require('./schema')

const URI = process.env.MONGODB_URI
const DATABASE = process.env.MONGODB_DATABASE
const COLLECTION = process.env.MONGODB_INVOICES_COLLECTION

/**
 * Get All Payments for an Invoice
 *
 * @param {String} invoiceId
 *
 * @returns {Promise}
 */
let get = async (invoiceId) => {
  let mongoClient = await MongoClient.connect(URI)

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .findOne({ _id: new ObjectID(invoiceId) }, { payments: true, _id: false })

  mongoClient.close()

  if (Object.keys(result).length === 0)
    return {}

  return result.payments
}

/**
 * Get a Payment for an Invoice
 *
 * @param {String} invoiceId
 * @param {String} transactionId
 *
 * @returns {Promise}
 */
let getSingle = async (invoiceId, transactionId) => {
  let mongoClient = await MongoClient.connect(URI)

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .findOne({ _id: new ObjectID(invoiceId), payments: { $elemMatch: { transactionId: transactionId } } })

  mongoClient.close()

  if (result === null)
    return {}

  return result.payments.find(function(payment) {
    return payment.transactionId === transactionId;
  });
}

/**
 * Create Payment for Invoice
 *
 * @param {Object} data - fields for creating new payment
 *
 * @return {Promise}
 */
let create = async (invoiceId, data) => {
  let payment = Object.assign({}, data)

  let validationResult = validateBySchema(payment, schema)

  if (!validationResult.valid) {
    console.error(JSON.stringify(validationResult.errors))
    throw new Error('Invalid payment')
  }

  let mongoClient = await MongoClient.connect(URI)

  payment.dateCreated = new Date()

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .updateOne({ _id: new ObjectID(invoiceId) }, { $push: { payments: payment }})

  mongoClient.close()

  return result
}

module.exports = {
  create,
  get,
  getSingle
}




































