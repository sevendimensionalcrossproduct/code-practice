import { createRouter, createWebHistory } from 'vue-router';
import { createApp } from 'vue';
import App from './App.vue';

// Define async components to split code
const Homepage = () => import('./Homepage.vue');
const Dictionary = () => import('./Dictionary.vue');
const DictionaryId = () => import('./DictionaryId.vue');

// Define routes for the app
const routes = [
  { path: '/', component: Homepage },
  { path: '/dictionary', component: Dictionary },
  { path: '/dictionary/:id', component: DictionaryId },
];

// Create the router instance
const router = createRouter({
  history: createWebHistory(), // Use history mode for cleaner URLs (no hash)
  routes, // Add the defined routes
});

const mountNode = document.querySelector('#app')

if (window.location.pathname.startsWith('/dictionary/')) {
  import('./DictionaryId.vue').then(({ default: DictionaryId }) => {
    createApp(DictionaryId).mount('#app')
  })
} else {
  const app = createApp(App)
  app.use(router)
  app.mount('#app')
}