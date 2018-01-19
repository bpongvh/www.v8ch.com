const APP_HOST = 'www-v8ch-com.v8ch.local';
const FILES = [
  'app/**/*.php',
  'packages/v8ch/combine-auth/**/*.php',
  'packages/v8ch/eloquent-model-traits/**/*.php',
  'public/css/*.css',
  'public/js/*.js',
  'resources/views/**/*.php',
  'routes/**/*.php'
];
module.exports = {
  'ui': {
    'port': 3001,
    'weinre': {
      'port': 8080
    }
  },
  'files': FILES,
  'watchOptions': {},
  'server': false,
  'proxy': APP_HOST,
  'port': 3000,
  'middleware': false,
  'serveStatic': [],
  'ghostMode': {
    'clicks': true,
    'scroll': true,
    'forms': {
      'submit': true,
      'inputs': true,
      'toggles': true
    }
  },
  'logLevel': 'info',
  'logPrefix': 'BS',
  'logConnections': false,
  'logFileChanges': true,
  'logSnippet': true,
  'rewriteRules': false,
  'open': 'local',
  'browser': 'default',
  'cors': false,
  'xip': false,
  'hostnameSuffix': false,
  'reloadOnRestart': false,
  'notify': true,
  'scrollProportionally': true,
  'scrollThrottle': 0,
  'scrollRestoreTechnique': 'window.name',
  'scrollElements': [],
  'scrollElementMapping': [],
  'reloadDelay': 2000,
  'reloadDebounce': 2000,
  'reloadThrottle': 5000,
  'plugins': [],
  'injectChanges': true,
  'startPath': null,
  'minify': true,
  'host': null,
  'localOnly': false,
  'codeSync': true,
  'timestamps': true,
  'clientEvents': [
    'scroll',
    'scroll:element',
    'input:text',
    'input:toggles',
    'form:submit',
    'form:reset',
    'click'
  ],
  'socket': {
    'socketIoOptions': {
      'log': false
    },
    'socketIoClientConfig': {
      'reconnectionAttempts': 50
    },
    'path': '/browser-sync/socket.io',
    'clientPath': '/browser-sync',
    'namespace': '/browser-sync',
    'clients': {
      'heartbeatTimeout': 5000
    }
  },
  'tagNames': {
    'less': 'link',
    'scss': 'link',
    'css': 'link',
    'jpg': 'img',
    'jpeg': 'img',
    'png': 'img',
    'svg': 'img',
    'gif': 'img',
    'js': 'script'
  }
};
