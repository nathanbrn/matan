// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
// console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

// console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
import { createApp, h } from 'vue';
import { createInertiaApp } from '@inertiajs/inertia-vue3';
import { InertiaProgress } from '@inertiajs/progress';
import Layout from '../frontend/Pages/Layout/Layout.vue'
InertiaProgress.init();

const pages = import.meta.glob('../frontend/Pages/**/*.vue', { eager: true });

createInertiaApp({
  resolve: (name) => {
    let page = pages[`../frontend/Pages/${name}.vue`];
    if (!page)
      throw new Error(
        `Unknown page ${name}. Is it located under Pages with a .vue extension?`,
      );
    page.default.layout = page.default.layout || Layout
    return page;
  },

  title: (title) => (title ? `${title} - Matam` : 'Matam'),

  setup({ el, App, props, plugin }) {
    const vueApp = createApp({
      render: () => h(App, props),
    });
    vueApp.use(plugin).mount(el);
  },
});
