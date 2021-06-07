
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

  const commentInput = document.getElementsByClassName("comment-input");
  
  for (let i = 0; i < commentInput.length; i++) {
    commentInput[i].addEventListener('click', event => {
      
      const commentButton = event.target;
      const commentPostId = commentButton.id;
      const commentTextForm = document.getElementById('comment');
      const commentText = commentTextForm.value;
      const commentShow = document.getElementById('showComment');
      
      const createComment = (commentPostId, commentText) => {
        sendRequest(commentEndpoint, 'POST', { post_id: commentPostId, comment_content: commentText })
        .then((data) => {
          commentTextForm.value = '';
          
          let fragment = document.createDocumentFragment();
          
          let childCommentContent = document.createElement("div");
          childCommentContent.className = 'comment-content';
          childCommentContent.setAttribute("id", data.comments.id);
          
          let childCommentUserStatus = document.createElement("div");
          childCommentUserStatus.className = 'comment-user-status';
          
          let childCommentUserImg = document.createElement("div");
          childCommentUserImg.className = 'comment-user-img';
          
          let childCommentText = document.createElement("div");
          childCommentText.className = 'commentText';
          
          let childCommentPostTime_destroy = document.createElement('div');
          childCommentPostTime_destroy.className = 'comment-postTime-destroy';
          
          let childText = document.createElement("p");
          childText.className = 'comment-content-text';
          childText.textContent = data.comments.comment_content;
          
          let childCommentAvaterImg = document.createElement('li');
          childCommentAvaterImg.className = 'comment-avaterImg';
          
          let childImg = document.createElement('img');
          childImg.src = `/uploads/profile/avatar_img/${data.comments.user_id}/${data.profiles}`
          
          let childCommentUserName = document.createElement('p');
          childCommentUserName.className = 'comment-userName';
          childCommentUserName.textContent = data.users;
          
          let childCommentDayTime = document.createElement('p');
          childCommentDayTime.className = 'comment-dayTime';
          childCommentDayTime.textContent = data.commentTime;
          
          let childDestroyButton = document.createElement('button');
          childDestroyButton.className = 'destroy-button';
          childDestroyButton.id = data.comments.id;
          
          let childIcon = document.createElement('i');
          childIcon.className = 'fas fa-trash-alt';
          
          childCommentAvaterImg.prepend(childImg);
          childCommentUserImg.prepend(childCommentAvaterImg);
          childCommentUserImg.appendChild(childCommentUserName);
          
          childDestroyButton.prepend(childIcon)
          
          childCommentPostTime_destroy.prepend(childCommentDayTime);
          childCommentPostTime_destroy.appendChild(childDestroyButton);
          
          childCommentUserStatus.prepend(childCommentUserImg);
          childCommentUserStatus.appendChild(childCommentPostTime_destroy);
          
          childCommentText.appendChild(childText);
          
          childCommentContent.prepend(childCommentUserStatus);
          childCommentContent.appendChild(childCommentText);
          
          fragment.prepend(childCommentContent);
          commentShow.prepend(fragment);

          childDestroyButton.addEventListener('click', commentItem)
        });

        
      }
      createComment(commentPostId, commentText);
    });
  }
    
  const commentDelete = document.getElementsByClassName("destroy-button");
  for (let j = 0; j < commentDelete.length; j++) {
    commentDelete[j].addEventListener('click', commentItem)
  }

  function commentItem(event) {
    if (window.confirm('コメントを削除しますか？')) {
      const deleteButton = event.target;
      const deleteCommentId = deleteButton.id;
      const deleteComment = (deleteCommentId) => {
        const deleteCommentEndpoint = commentEndpoint + '/' + `${deleteCommentId}`;
        sendRequest(deleteCommentEndpoint, 'DELETE', { id: deleteCommentId })
        .then(() => {
          deleteButton.closest(".comment-content").remove()
        });
      }
      deleteComment(deleteCommentId);
    } else {
      return false
    }
  }
}