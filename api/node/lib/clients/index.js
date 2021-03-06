'use strict'

let { MongoClient, ObjectID } = require('mongodb')
let { validateBySchema } = require('../shared/validator')
let schema = require('./schema')

const URI = process.env.MONGODB_URI
const DATABASE = process.env.MONGODB_DATABASE
const COLLECTION = process.env.MONGODB_CLIENTS_COLLECTION

/**
 * Create Client
 *
 * @param {Object} data - fields for creating new client
 *
 * @return {Promise}
 */
let create = async (data) => {
  let client = Object.assign({}, data)

  let validationResult = validateBySchema(client, schema)

  if (!validationResult.valid) {
    console.error(JSON.stringify(validationResult.errors))
    throw new Error('Invalid client')
  }

  let mongoClient = await MongoClient.connect(URI)

  client.dateCreated = new Date()
  client.dateUpdated = new Date()

  let result = await mongoClient
    .db(DATABASE)
    .collection(COLLECTION)
    .insertOne(client)

  mongoClient.close()

  return result
}

/**
 * Get all Clients
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
 * Find Client by ID
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




































