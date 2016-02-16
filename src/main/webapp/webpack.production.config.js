var webpack = require('webpack');
var path = require('path');
module.exports = {
    entry: {
        main: './app/main.jsx'
    },
    output: {
        path: path.join(__dirname, './app/js/build'),
        filename: '[name].js',
        chunkFilename: '[id].chunk.js',
    },
    module: {
        loaders: [
            {
                test: /\.css$/,
                exclude: /node_modules/,
                loader: "style!css"
            },
            {
                test: /\.jsx?$/,
                loader: "babel",
                exclude: /node_modules/,
                query: {
                    presets: ['es2015', 'react', 'stage-2'],
                }
            }
        ]
    },
    devtool: 'source-map',
    resolve: {
        root: path.resolve('./app'),
        extensions: ['', '.js', '.jsx']
    },
    plugins: [
        new webpack.optimize.DedupePlugin(),
        new webpack.optimize.OccurenceOrderPlugin(),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false
            }
        }),
        new webpack.DefinePlugin({
            __DEVELOPMENT__: false,
            'process.env': {
                // This has effect on the react lib size
                NODE_ENV: JSON.stringify('production'),
            }
        }),
    ],
};
