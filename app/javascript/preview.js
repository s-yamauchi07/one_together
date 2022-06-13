window.addEventListener('load', () => {
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('registration-form');
  const previewList = document.getElementById('previews')
  const cameraIcon = document.querySelector('.add-image')

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="spot_tag[spot_image]"]')
  fileField.addEventListener('change', (e) => {
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

  // 画像表示するための要素を作成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
    cameraIcon.setAttribute('style','display:none;');

  })
});
