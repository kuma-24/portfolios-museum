'use strict';

{
  const likeColor = 'js-like-button like #ff3366';
  const unlikeColor = 'js-like-button unlike #fff';
  const likeEndpoint = '/api/v1/likes';
  const getCsrfToken = () => {
    const metas = document.getElementsByTagName('meta');
    for (let meta of metas) {
      if (meta.getAttribute('name') === 'csrf-token') {
        return meta.getAttribute('content');
      }
    }
    return '';
  }

  const sendRequest = async (endpoint, method, json) => {
    const response = await fetch(endpoint, {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-Token': getCsrfToken()
      },
      method: method,
      credentials: 'same-origin',
      body: JSON.stringify(json)
    });
    if (!response.ok) {
      throw Error(response.statusText);
    } else {
      return response.json();
    }
  }

  const likeButtons = document.getElementsByClassName('js-like-button');

  for (let i = 0; i < likeButtons.length; i++) {
    likeButtons[i].addEventListener('click', event => {
      const button = event.target;
   
      const createLike = (postId, button) => {
        sendRequest(likeEndpoint, 'POST', { post_id: postId })
        .then((data) => {
          button.value = data.like_id;
          button.lastElementChild.innerText = data.post_id;
        });
      }
      
      const deleteLike = (likeId, postId, button) => {
        const deleteLikeEndpoint = likeEndpoint + '/' + `${likeId}`;
        sendRequest(deleteLikeEndpoint, 'DELETE', { id: likeId, post_id: postId })
        .then((data) => {
          button.value = '';
          button.lastElementChild.innerText = data.post_id;
        });
      }
      
      if (!!button) {
        const currentColor = button.className;
        const postId = button.id; 
        const likeId = button.value;
        
        if (currentColor === unlikeColor) {
          button.className = likeColor;
          createLike(postId, button);
        } else {
          button.className = unlikeColor;
          deleteLike(likeId, postId, button);
        }
      }      
    });
  }
}