import app from './app.js';
import home from './home.js';
import article from './article.js';
import bucket from './bucket.js';
import search from './search.js';

const pathname = window.location.pathname;

document.addEventListener('DOMContentLoaded', () => {
  app.init();
  if (pathname.includes('/home.html')) {
    home.init();
  } else if (
    pathname.includes('/article.html') ||
    pathname.includes('/real-article.html')
  ) {
    article.init();
  } else if (pathname.includes('/bucket.html')) {
    bucket.init();
  } else if (pathname.includes('/search.html')) {
    search.init();
  }
});
