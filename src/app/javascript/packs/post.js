'use strict';

window.onload = function() {
  const post_get = document.getElementById('post-get');

  post_get.addEventListener('click', function() {
    fetch('/new', {
      method: 'GET'
    })
    .then(function(response) {
      const response_message = response.status + ':' + response.statusText
      console.log(response_message);
      window.alert('response_message=' + response_message);
    });
  });


  const post_post = document.getElementById('post-post');
  post_post.addEventListener('click', function() {
    const post_data = {
      key1: "data1",
      key2: "data2",
      key3: 3
    };

    fetch('/new', {
      method: 'POST',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': getCsrfToken()
      },
      body: JSON.stringify(post_data),
    })
    .then(function(response) {
      const response_message = response.status + ':' + response.statusText
      console.log(response_message);
      window.alert('response_message=' + response_message);
    });
  });

  const getCsrfToken = () => {
    const metas = document.getElementsByTagName('meta');
    for (let meta of metas) {
      if (meta.getAttribute('name') === 'csrf-token') {
          console.log('csrf-token:', meta.getAttribute('content'));
          return meta.getAttribute('content');
      }
    }
    return '';
  } 
};




