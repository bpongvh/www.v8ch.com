import CleanPlugin from "clean-webpack-plugin";
import CopyPlugin from "copy-webpack-plugin";
import DotenvPlugin from "dotenv-webpack";
import HtmlPlugin from "html-webpack-plugin";
import MiniCssExtractPlugin from "mini-css-extract-plugin";
import path from "path";
import VueLoaderPlugin from "vue-loader/lib/plugin";
import * as config from "./config.json";

export default (env = {}) => {
  if (process.env.NODE_ENV === undefined) {
    process.env.NODE_ENV = env.production ? "production" : "development";
  }

  // ----------------------
  // postcss-loader Options
  // ----------------------

  /* eslint-disable global-require */
  const postcssLoaderOptions = {
    plugins: [
      require("autoprefixer")(),
      require("cssnano")({
        preset: ["default", { discardComments: { removeAll: true } }]
      })
    ]
  };
  /* eslint-enable global-require */

  // ----------------------
  // Plugins
  // ----------------------

  const cleanPaths = !Array.isArray(config.paths.clean)
    ? []
    : config.paths.clean.map(cleanPath => path.join(process.cwd(), cleanPath));
  const cleanOptions = {
    root: process.cwd(),
    verbose: true
  };
  const copyPatterns = [
    {
      context: "priv/packages/@v8ch/trivia-challenge/public/css",
      from: "*.+(css|map)",
      to: "css"
    },
    {
      from: "priv/packages/@v8ch/trivia-challenge/public/index.html",
      to: "trivia-challenge.html"
    },
    {
      context: "priv/packages/@v8ch/trivia-challenge/public/js",
      from: "*.js",
      to: "js"
    }
  ];
  const htmlOptions = {
    minify: {
      collapseWhitespace: true,
      removeComments: true
    },
    template: config.paths.htmlTemplate
  };
  const miniCssExtractOptions = {
    filename: env.production ? "css/[name].[chunkhash].css" : "css/[name].css",
    chunkFilename: "css/[id].css"
  };

  const commonPlugins = [
    new CopyPlugin(copyPatterns),
    new DotenvPlugin(),
    new HtmlPlugin(htmlOptions),
    new VueLoaderPlugin()
  ];

  const developmentPlugins = [...commonPlugins];
  const productionPlugins = [
    ...developmentPlugins,
    new CleanPlugin(cleanPaths, cleanOptions),
    new MiniCssExtractPlugin(miniCssExtractOptions)
  ];

  // ----------------------
  // Config object
  // ----------------------

  return {
    context: process.cwd(),
    devServer: {
      contentBase: config.paths.dist,
      proxy: config.proxy && config.proxy.length > 0 ? config.proxy : undefined
    },
    devtool: env.production ? "source-map" : "cheap-module-eval-source-map",
    entry: config.entry,
    module: {
      rules: [
        {
          test: /\.(eot|otf|svg|ttf)$/,
          loader: "file-loader",
          options: { name: "/fonts/[name].[ext]" }
        },
        {
          test: /\.(gif|jpe?g|png|svg)$/i,
          use: [
            "file-loader?name=images/[name].[ext]",
            "image-webpack-loader?bypassOnDebug"
          ]
        },
        {
          test: /\.jsx?$/,
          exclude: /node_modules/,
          loader: "babel-loader"
        },
        {
          test: /\.html$/,
          loader: "html-loader"
        },
        {
          test: /\.(png|gif|jpg)$/,
          loader: "url-loader",
          options: {
            limit: "25000",
            name: "/images/[name].[ext]"
          }
        },
        {
          test: /\.(sa|sc|c)ss$/,
          use: [
            env.production ? MiniCssExtractPlugin.loader : "vue-style-loader",
            {
              loader: "css-loader",
              options: { sourceMap: true }
            },
            "resolve-url-loader",
            {
              loader: "postcss-loader",
              options: postcssLoaderOptions
            },
            {
              loader: "sass-loader",
              options: { sourceMap: true }
            },
            {
              loader: "sass-resources-loader",
              options: {
                resources: config.paths.sassResources
              }
            }
          ]
        },
        {
          test: /\.vue$/,
          loader: "vue-loader"
        },
        {
          test: /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          use: [
            {
              loader: "url-loader",
              options: {
                fallback: "file-loader",
                limit: 10000,
                outputPath: "fonts",
                publicPath: "../fonts"
              }
            }
          ]
        }
      ]
    },
    output: {
      devtoolModuleFilenameTemplate: "webpack:///[absolute-resource-path]",
      filename: env.production ? "js/[name].[hash].js" : "js/[name].js",
      path: path.join(process.cwd(), config.paths.output),
      publicPath: ""
    },
    plugins: env.production ? productionPlugins : developmentPlugins,
    resolve: {
      extensions: [".js", ".jsx", ".vue"]
    }
  };
};
