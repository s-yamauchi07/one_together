document.addEventListener('DOMContentLoaded', () => {
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('registration-form');
  const cameraIcon = document.querySelector('.fa-camera')

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;

  const fileField = document.querySelectorAll('input[type="file"][name="spot_tag[spot_images][]"]')
  fileField.forEach(function(list) {
  list.addEventListener('change', (e) => {
    // 何枚目の操作をしているかを取得
    const dataIndex = e.target.getAttribute('data-index');
    const addPreview = document.getElementById(`data-index=${dataIndex}`)

    // 古いプレビューが存在する場合は削除
    // const alreadyPreview = document.querySelector('.preview')
    // if (alreadyPreview) {
    //   alreadyPreview.remove();
    // }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    addPreview.setAttribute('style','opacity: 0')
    addPreview.setAttribute('style',`background-image:url(${blob});`);
  })




  // 画像表示するための要素を作成
  //   const previewWrapper = document.createElement('div');
  //   previewWrapper.setAttribute('class', 'preview');

  //   const previewImage = document.createElement('img');
  //   previewImage.setAttribute('class', 'preview-image');
  //   previewImage.setAttribute('src', blob);

  //   previewWrapper.appendChild(previewImage);
  //   previewList.appendChild(previewWrapper);
  })
});
