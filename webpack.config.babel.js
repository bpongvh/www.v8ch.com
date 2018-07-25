import DotenvPlugin from 'dotenv-webpack';
import path from 'path';
import VueLoaderPlugin from 'vue-loader/lib/plugin';

module.exports = (env = {}) => {
  const babelLoaderOptions = {
    cacheDirectory: true,
    plugins: [
      'transform-object-rest-spread',
      [
        'transform-runtime',
        {
          polyfill: false,
          helpers: false,
        },
      ],
    ],
    presets: [
      [
        'env',
        {
          modules: false,
          targets: {
            browsers: ['> 2%'],
          },
        },
      ],
      'stage-2',
    ],
  };

  const developmentPlugins = [
    new DotenvPlugin(),
    new VueLoaderPlugin(),
  ];

  // ----------------------
  // Config object
  // ----------------------

  return {
    devtool: env.production ? 'cheap-module-source-map' : 'cheap-module-eval-source-map',
    entry: { v8ch: ['./priv/src/v8ch.js'] },
    module: {
      rules: [
        {
          test: /\.vue$/,
          loader: 'vue-loader',
        },
        {
          test: /\.js$/,
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
          options: { name: '/fonts/[name].[ext]' },
        },
        {
          test: /\.scss$/,
          use: [
            'vue-style-loader',
            'css-loader',
            'sass-loader',
            {
              loader: 'sass-resources-loader',
              options: {
                resources: './priv/scss/_variables.scss',
              },
            },
          ],
        },
      ],
    },
    optimization: {
      splitChunks: {
        chunks: 'all',
      },
    },
    output: {
      devtoolModuleFilenameTemplate: 'webpack:///[absolute-resource-path]',
      filename: 'js/[name].js',
      path: path.join(process.cwd(), 'priv/static'),
      publicPath: '',
    },
    plugins: developmentPlugins,
    resolve: {
      extensions: ['.js', '.vue'],
    },
  };
};
