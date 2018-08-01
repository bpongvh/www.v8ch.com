import Vue from 'vue';
import App from './components/App.vue';
// import '../scss/style.scss';

console.log(`[v8ch app] in s true: ${JSON.stringify(true)}`);

new Vue({
  render: h => h(App),
}).$mount('#v8ch');
