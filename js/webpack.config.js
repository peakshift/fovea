const path = require('path')
const serverlessWebpack = require('serverless-webpack')
const nodeExternals = require('webpack-node-externals')

module.exports = {
  entry: serverlessWebpack.lib.entries,
  target: 'node',
  externals: [nodeExternals()],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ['es2017']
          }
        }
      }
    ]
  },
  output: {
    libraryTarget: 'commonjs',
    path: path.join(__dirname, '.webpack'),
    filename: '[name].js',
  }
}