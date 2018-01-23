/**
 * @author Robert Pratt <bpong@v8ch.com>
 * @copyright Robert Pratt 2018
 * @file Webpack config file for www.v8ch.com repository. Compiles JS and CSS for frontend.
 */

import CleanWebpackPlugin from 'clean-webpack-plugin';
import ExtractTextPlugin from 'extract-text-webpack-plugin';
import HardSourceWebpackPlugin from 'hard-source-webpack-plugin';
import path from 'path';
import UglifyJsPlugin from 'uglifyjs-webpack-plugin';
import webpack from 'webpack';

const extractSassPlugin = new ExtractTextPlugin({filename: '/css/[name].css'});

module.exports = (env = {}) => {
  const babelLoaderOptions = {
    cacheDirectory: true,
    plugins: [
      'transform-object-rest-spread',
      [
        'transform-runtime', {
        'polyfill': false,
        'helpers': false,
      }],
    ],
    presets: [
      [
        'env', {
        'modules': false,
        'targets': {
          'browsers': ['> 2%'],
          uglify: env.production,
        },
      }],
    ],
  };
  const commonPlugins = [
    new CleanWebpackPlugin(
        [
          'public/css',
          'public/fonts',
          'public/js',
        ],
    ),
    extractSassPlugin,
    new HardSourceWebpackPlugin(),
    new webpack.optimize.CommonsChunkPlugin({
      name: 'vendor',
      minChunks: Infinity,
    }),
    new webpack.optimize.CommonsChunkPlugin({
      name: 'manifest',
      minChunks: Infinity,
    }),
  ];
  const extractSassLoaders = [
    {
      loader: 'css-loader',
      options: {
        importLoaders: env.production ? 2 : 1,
        minimize: env.production,
        sourceMap: true,
        url: true,
      },
    },
    {
      loader: 'resolve-url-loader',
      options: {sourceMap: true},
    },
    {
      loader: 'sass-loader',
      options: {sourceMap: true},
    },
  ];
  if (env.production) {
    const postCssLoader = {
      loader: 'postcss-loader',
      options: {
        sourceMap: true,
        ident: 'postcss',
        plugins: () => [require('autoprefixer')],
      },
    };
    extractSassLoaders.splice(1, 0, postCssLoader);
  }

  const productionOnlyPlugins = [
    new UglifyJsPlugin({sourceMap: true}),
    new webpack.DefinePlugin({'process.env': {NODE_ENV: '"production"'}}),
  ];
  return {
    devtool: env.production ? "cheap-module-source-map" : "cheap-module-eval-source-map",
    entry: {
      'granary-auth': [
        './packages/@v8ch/granary-auth/ts/granary-auth.tsx',
      ],
      'granary-vendor-react': [
        'react',
        'react-dom',
        'react-router-dom',
        'reactstrap',
        'validator',
      ],
      'style': [
        './resources/assets/sass/style.scss',
      ],
    },
    module: {
      rules: [
        {
          test: /\.tsx?$/,
          loader: 'ts-loader',
          include: [
            path.join(process.cwd(), 'packages/@v8ch/granary-auth/ts'),
            path.join(process.cwd(), 'resources/assets/ts'),
          ],
          exclude: /node_modules/,
          options: {
            appendTsSuffixTo: [/\.vue$/],
          },
        },
        {
          test: /\.jsx?$/,
          exclude: /node_modules/,
          use: [
            {
              loader: 'babel-loader',
              options: babelLoaderOptions,
            },
          ],
        },
        {
          test: /\.html$/,
          loader: 'html-loader',
        },
        {
          test: /\.(png|gif|jpg)$/,
          loader: 'url-loader',
          options: {
            limit: '25000',
            name: '/images/[name].[ext]',
          },
        },
        {
          test: /\.(eot|svg|otf|ttf|woff2?)$/,
          loader: 'file-loader',
          options: {name: '/fonts/[name].[ext]'},
        },
        {
          test: /\.vue$/,
          loader: 'vue-loader',
          options: {
            loaders: {
              js: {
                loader: 'babel-loader',
                options: babelLoaderOptions,
              },
              scss: 'vue-style-loader!css-loader!sass-loader',
            },
          },
        },
        {
          test: /\.scss$/,
          use: extractSassPlugin.extract({
            fallback: 'style-loader',
            use: extractSassLoaders,
          }),
        },
      ],
    },
    output: {
      chunkFilename: 'js/app-[name].js',
      devtoolModuleFilenameTemplate: "webpack:///[absolute-resource-path]",
      filename: 'js/[name].js',
      path: path.join(process.cwd(), 'public'),
      publicPath: '',
    },
    plugins: env.production ? [
      ...commonPlugins,
      ...productionOnlyPlugins,
    ] : commonPlugins,
    resolve: {
      extensions: ['.js', '.ts', '.tsx', '.vue'],
    },
  };
};
