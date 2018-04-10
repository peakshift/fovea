# Getting Started

### Prerequisites

- Node.js
- Serverless CLI


### Environment Variables

Define these environment variables in `serverless.env.yml` file

```
dev:
  NODE_ENV
  MONGODB_URI
  MONGODB_DATABASE
  MONGODB_INVOICES_COLLECTION
  MONGODB_CLIENTS_COLLECTION

test:
  NODE_ENV
  MONGODB_URI
  MONGODB_DATABASE
  MONGODB_INVOICES_COLLECTION
  MONGODB_CLIENTS_COLLECTION

prod:
  NODE_ENV
  MONGODB_URI
  MONGODB_DATABASE
  MONGODB_INVOICES_COLLECTION
  MONGODB_CLIENTS_COLLECTION
```


### Setup Project

- `npm install`
- `serverless deploy -s dev`


### Tests

Run the tests using `npm test`


### Linting

Run linting using `./node_modules/.bin/eslint "**/*.js"`
