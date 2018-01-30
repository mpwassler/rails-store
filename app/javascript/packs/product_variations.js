/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'product_variations' %> (and
// <%= stylesheet_pack_tag 'product_variations' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import ProductVariations from '../product_variations.vue'
import axios from 'axios'
let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

window.axios = axios

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#product-variations',
    data: {
      message: "Can you say hello?"
    },
    components: { ProductVariations }
  })
})