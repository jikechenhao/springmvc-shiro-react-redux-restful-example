var webpack = require('webpack');
var path = require('path');
module.exports = {
    entry: {
        main: [
            'webpack-hot-middleware/client?path=http://localhost:3000/__webpack_hmr',
            './app/main.jsx'
        ]
    },
    output: {
        path: path.join(__dirname, './app/js/build'),
        filename: '[name].js',
        chunkFilename: '[id].chunk.js',
        publicPath: 'http://localhost:3000/app/js/build/',
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
                    plugins: [
                        ['react-transform', {
                            transforms: [
                                {
                                    transform: 'react-transform-hmr',
                                    imports: ['react'],
                                    locals: ['module'],
                                }
                            ],
                        }],
                    ],
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
        new webpack.HotModuleReplacementPlugin(),
        new webpack.NoErrorsPlugin(),
        new webpack.DefinePlugin({
            __DEVELOPMENT__: false
        }),
    ],
};
