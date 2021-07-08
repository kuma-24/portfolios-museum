
{
  const commentEndpoint = '/api/v1/comments';

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

  const commentInput = document.getElementsByClassName("commentText-input");
  
  for (let i = 0; i < commentInput.length; i++) {
    commentInput[i].addEventListener('click', event => {
      
      const commentButton = event.target;
      const commentPostId = commentButton.id;
      const commentTextForm = document.getElementById('commentText');
      const commentText = commentTextForm.value;
      const commentShow = document.getElementById('commentText-output');
      const TextCount = document.getElementById('limit-count');
      
      const createComment = (commentPostId, commentText) => {
        sendRequest(commentEndpoint, 'POST', { post_id: commentPostId, comment_content: commentText })
        .then((data) => {
          commentTextForm.value = '';
          TextCount.textContent = '0';
          
          if (data.error == undefined) {
            let fragment = document.createDocumentFragment();
            let childMainContent = document.createElement("div");
            let childFirstInformation = document.createElement("div");
            let childSecondInformation = document.createElement("div");
            let childUserShowLink = document.createElement('a');
            let childAvatarImg = document.createElement('img');
            let childIcon = document.createElement('i');
            let childCommentDestroy = document.createElement('button');
            let childUserName = document.createElement('span');
            let childCommentTime = document.createElement('span');
            let childCommentText = document.createElement('span');

            childMainContent.className = 'post-commentText-mainContent';
            childFirstInformation.className = 'post-comment-firstInformation';
            childSecondInformation.className = 'post-comment-secondInformation';
            childUserShowLink.className = 'commentUser-userShow-link';
            childUserShowLink.href = `/users/${data.comments.user_id}`;
            childUserName.className = 'commentUser-userName';
            childUserName.textContent = data.users;
            childCommentTime.className = 'commentUser-commentTime';
            childCommentTime.textContent = data.commentTime;
            childCommentDestroy.className = 'commentUser-commentDestroy';
            childCommentDestroy.setAttribute("id", data.comments.id);
            childIcon.className = 'fas fa-trash-alt icon-size';
            childCommentText.className = 'commentUser-commentText';
            childCommentText.textContent = data.comments.comment_content;
           
            if (data.profiles[0] == null) {
              childAvatarImg.className = 'commentUser-avatarImg'
              childAvatarImg.src = '/assets/guest_img.jpg'
            } else {
              childAvatarImg.className = 'commentUser-avatarImg'
              childUserShowLink.src = `/uploads/profile/avatar_img/${data.comments.user_id}/${data.profiles}`
            }

            childCommentDestroy.prepend(childIcon);
            childUserShowLink.prepend(childAvatarImg);
            childSecondInformation.prepend(childCommentText);
            childFirstInformation.append(childUserShowLink, childUserName, childCommentTime, childCommentDestroy);
            childMainContent.append(childFirstInformation, childSecondInformation);
            fragment.prepend(childMainContent);
            
            commentShow.prepend(fragment);
            childCommentDestroy.addEventListener('click', commentItem);
            const commentErrorNote = document.querySelector('.post-commentInput-error-info');
            commentErrorNote == null ? false : commentErrorNote.remove();
          } else {
            const commentNote = document.querySelector('.post-commentInput-contentNote');
            let childErrorinfo = document.createElement('span');
            childErrorinfo.className = 'post-commentInput-error-info';
            childErrorinfo.textContent = data.error.comment_content;
            commentNote.prepend(childErrorinfo);
          }
        });
      }
      createComment(commentPostId, commentText);
    });
  }
  const commentDelete = document.getElementsByClassName("commentUser-commentDestroy");
  for (let j = 0; j < commentDelete.length; j++) {
    commentDelete[j].addEventListener('click', commentItem);
  }
  function commentItem(event) {
    if (window.confirm('コメントを削除しますか？')) {
      const deleteButton = event.target;
      const deleteCommentId = deleteButton.id;

      const deleteComment = (deleteCommentId) => {
        const deleteCommentEndpoint = commentEndpoint + '/' + `${deleteCommentId}`;
        sendRequest(deleteCommentEndpoint, 'DELETE', { id: deleteCommentId })
        .then(() => {
          deleteButton.closest('.post-commentText-mainContent').remove();
        });
      }
      deleteComment(deleteCommentId);
    } else {
      return false
    }
  }
}

{
  const commentTextInput = document.getElementById('commentText');
  const commentTextCount = document.getElementById('limit-count');

  commentTextInput.addEventListener('keyup', () => {
    commentTextCount.textContent = commentTextInput.value.length;
  });
}