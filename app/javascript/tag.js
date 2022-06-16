window.addEventListener('load', () => {
  const tagField = document.getElementById('tag-name')
  if (!tagField) return null;

  const addTagBtn = document.getElementById('add-tag-btn')
  const tagList = document.getElementById('registration-table')
  // タグを保存するための配列を準備
  const tags = []

  // タグの逐次機能実装
  tagField.addEventListener('input', ()=> {
    const keyword = tagField.value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET",`/spots/tag_search/?keyword=${keyword}`, true);
    XHR.responseType = "json"
    XHR.send();

    XHR.onload = () => {
      const resultArea = document.getElementById('tag-search-result');
      // 以前検索した結果をリセットする
      resultArea.innerHTML = ""
      
      if (XHR.response) {
        const resultsTag = XHR.response.keyword;
        
        resultsTag.forEach((result) => {
          const childElement = document.createElement('div');
          childElement.setAttribute('class', "child");
          childElement.setAttribute('id', result.id);
          childElement.innerHTML = result.tag_name;
          resultArea.appendChild(childElement)

          const clickElement = document.getElementById(result.id);
          clickElement.addEventListener("click", () => {
            document.getElementById('tag-name').value = clickElement.textContent;
            clickElement.remove();
            resultArea.innerHTML = ""
          });
        });
      }
    }
  })


  // タグ追加機能
  addTagBtn.addEventListener('click', () => {
    // 文字列.trim()で文字列から空白文字を削除
    const tagName = tagField.value.trim()
    const HTML = `
      <input name="spot_tag[tag_ids][]" type="checkbox" class="tags" checked="on" value="${tagName}">${tagName}
    `
    
    // someメソッドで配列の中のデータと一致するデータがあるかを判断。1つでも条件を満たす値がある場合は、trueを返す
    let duplicateTag = tags.some(value => value == tagName)

    if (!tagName) {
      alert('スペースを除いて入力してください')
      tagField.value = ""
    } else if (duplicateTag) {
      alert('重複したタグは保存できません')
      tagField.value = ""
    } else {
      tags.push(tagName)
      tagList.insertAdjacentHTML("afterend", HTML)
      tagField.value = ""
    }
  })


})